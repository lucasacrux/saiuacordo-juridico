import "dotenv/config";
import OpenAI from "openai";
import readline from "node:readline/promises";
import { stdin as input, stdout as output } from "node:process";
import { TOOLS_FOR_OPENAI, TOOL_ROUTER, type ToolName } from "./tools.js";

const client = new OpenAI({ apiKey: process.env.OPENAI_API_KEY });

async function approve(prompt: string): Promise<boolean> {
  const rl = readline.createInterface({ input, output });
  const ans = (await rl.question(`\nProposta do agente: ${prompt}\nAprovar? (s/N): `)).trim().toLowerCase();
  rl.close();
  return ans === "s" || ans === "sim" || ans === "y";
}

async function main() {
  const rl = readline.createInterface({ input, output });
  const user = (await rl.question("Diga o que deseja fazer: "));
  rl.close();

  // 1) Pede ao modelo para escolher uma ferramenta (function calling)
  const resp = await client.responses.create({
    model: "gpt-4.1-mini",
    input: [
      { role: "system", content: "Você é um operador que usa ferramentas para executar ações de BD com segurança. Se não houver ferramenta adequada, explique o que falta." },
      { role: "user", content: user }
    ],
    tools: TOOLS_FOR_OPENAI
  });

  // 2) Procura por uma chamada de ferramenta
  const toolCalls = resp.output
    .filter(p => p.type === "tool_call")
    .map(p => p);

  if (toolCalls.length === 0) {
    console.log("\nResposta do modelo:", resp.output_text);
    return;
  }

  for (const call of toolCalls) {
    // @ts-ignore - SDK retorna union com tool/json
    const name = call.tool_call?.function?.name as ToolName;
    // @ts-ignore
    const args = call.tool_call?.function?.arguments as any;

    if (!name || !(name in TOOL_ROUTER)) {
      console.log("\nO modelo pediu uma ferramenta desconhecida:", name);
      continue;
    }

    const { zod, run } = TOOL_ROUTER[name];

    // 3) Validação local
    const parsed = zod.safeParse(args);
    if (!parsed.success) {
      console.error("\nParâmetros inválidos:", parsed.error.issues);
      continue;
    }

    // 4) Confirmação humana
    const nice = JSON.stringify({ tool: name, args: parsed.data }, null, 2);
    const ok = await approve(nice);
    if (!ok) {
      console.log("\nOperação cancelada.");
      continue;
    }

    // 5) Executa a ação
    try {
      const result = await run(parsed.data as any);
      console.log("\nExecutado com sucesso. Resultado:", result);
    } catch (e: any) {
      console.error("\nFalha ao executar:", e.message || e);
    }
  }
}

main().catch(err => {
  console.error(err);
  process.exit(1);
});
