import re, csv, time
from pathlib import Path
from playwright.sync_api import sync_playwright, TimeoutError as PlaywrightTimeout

# --- Utilidades CNJ ---
CNJ_RE = re.compile(r'^(\d{7})-(\d{2})\.(\d{4})\.(\d)\.(\d{2})\.(\d{4})$')
def parse_cnj(cnj: str):
    s = re.sub(r'\s+', '', cnj)
    m = CNJ_RE.match(s)
    if not m:
        raise ValueError(f"CNJ inválido: {cnj}")
    # NNNNNNN-DD.AAAA
    numero_prefixo = f"{m.group(1)}-{m.group(2)}.{m.group(3)}"
    # TR=26 (SP), OOOO = foro
    foro = m.group(6)
    return {
        "cnj": s,
        "numero_prefixo": numero_prefixo,   # ex.: 0006275-72.2023
        "foro": foro,                       # ex.: 0100
        "unificado": s                      # CNJ completo
    }

def build_tjsp_url(cnj_parts: dict) -> str:
    # Padrão observado publicamente no e-SAJ (cpopg/search.do)
    # Parâmetros úteis: dadosConsulta.valorConsultaNuUnificado, foroNumeroUnificado, numeroDigitoAnoUnificado
    base = "https://esaj.tjsp.jus.br/cpopg/search.do"
    qs = (
        "cbPesquisa=NUMPROC"
        "&dadosConsulta.localPesquisa.cdLocal="
        "&dadosConsulta.tipoNuProcesso=UNIFICADO"
        "&dadosConsulta.valorConsulta="
        f"&dadosConsulta.valorConsultaNuUnificado={cnj_parts['unificado']}"
        f"&foroNumeroUnificado={cnj_parts['foro']}"
        f"&numeroDigitoAnoUnificado={cnj_parts['numero_prefixo']}"
    )
    return f"{base}?{qs}"

# --- Coletor ---
def collect_movs_for_cnj(page, cnj: str):
    parts = parse_cnj(cnj)
    url = build_tjsp_url(parts)
    page.goto(url, wait_until="load", timeout=120_000)

    # Se houver aba "Movimentações", clica (nem sempre é necessário)
    try:
        if page.get_by_role("link", name="Movimentações").count():
            page.get_by_role("link", name="Movimentações").click()
            page.wait_for_timeout(400)
    except PlaywrightTimeout:
        pass

    # Captura linhas da tabela de movimentações (estrutura pode variar — deixo genérico)
    rows = page.locator("table tbody tr")
    rows_count = rows.count()
    data = []
    for i in range(rows_count):
        tds = rows.nth(i).locator("td")
        if tds.count() >= 2:
            dt = tds.nth(0).inner_text().strip()
            mov = tds.nth(1).inner_text().strip()
            if dt or mov:
                data.append({"cnj": parts["unificado"], "data": dt, "movimentacao": mov})
    return data

def first_run_login(playwright_profile: Path):
    """Executa uma vez em modo visível para você logar no e-SAJ.
    A sessão fica armazenada no perfil persistente."""
    with sync_playwright() as pw:
        ctx = pw.chromium.launch_persistent_context(
            user_data_dir=str(playwright_profile),
            headless=False,
            args=["--disable-blink-features=AutomationControlled"]
        )
        page = ctx.new_page()
        page.goto("https://esaj.tjsp.jus.br/sajcas/login", wait_until="load")
        print("\n➡ Faça login no e-SAJ (OAB/senha/certificado)."
              "\n   Se aparecer captcha, resolva manualmente."
              "\n   Depois de ver sua área logada, volte aqui e pressione ENTER.")
        input()
        ctx.storage_state(path=playwright_profile / "state.json")
        ctx.close()

def run_batch(cnjs, playwright_profile: Path, out_csv: Path, delay_s: float = 1.5):
    with sync_playwright() as pw:
        ctx = pw.chromium.launch_persistent_context(
            user_data_dir=str(playwright_profile),
            headless=True,
            args=["--disable-blink-features=AutomationControlled"]
        )
        page = ctx.new_page()
        all_rows = []
        for cnj in cnjs:
            try:
                rows = collect_movs_for_cnj(page, cnj)
                all_rows.extend(rows)
                time.sleep(delay_s)  # seja gentil: não dispare requisições em rajada
            except Exception as e:
                print(f"[ERRO] {cnj}: {e}")

        # grava CSV
        out_csv.parent.mkdir(parents=True, exist_ok=True)
        with out_csv.open("w", newline="", encoding="utf-8") as f:
            w = csv.DictWriter(f, fieldnames=["cnj", "data", "movimentacao"])
            w.writeheader()
            w.writerows(all_rows)

        ctx.close()

if __name__ == "__main__":
    profile = Path("./tjsp_profile")
    # Rode UMA vez para logar:
    if not (profile / "state.json").exists():
        first_run_login(profile)

    # Exemplo de lista de CNJs (formato CNJ completo)
    cnj_lista = [
        "0006275-72.2023.8.26.0320",
        "0007134-29.2024.8.26.0005",
        # adicione os seus…
    ]
    run_batch(cnj_lista, profile, Path("./movimentacoes_tjsp.csv"))
    print("✔ movs salvas em movimencoes_tjsp.csv")
