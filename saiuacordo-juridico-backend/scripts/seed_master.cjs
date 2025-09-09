// scripts/seed_master.cjs
require("dotenv").config();
const { createClient } = require("@supabase/supabase-js");
const bcrypt = require("bcryptjs");

(async () => {
  const supa = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
  const hash = bcrypt.hashSync("saiu123", 10);

  async function upsertByCpfCnpj(cpf_cnpj, patch = {}) {
    if (!cpf_cnpj) return;
    const { data, error } = await supa.from("users")
      .select("id")
      .eq("cpf_cnpj", cpf_cnpj)
      .limit(1)
      .maybeSingle();
    if (error) throw error;

    if (data?.id) {
      const { error: e2 } = await supa.from("users")
        .update({ password_hash: hash, role: "admin", ...patch })
        .eq("id", data.id);
      if (e2) throw e2;
      console.log(`OK: update cpf_cnpj=${cpf_cnpj}`);
    } else {
      const { error: e3 } = await supa.from("users")
        .insert([{ cpf_cnpj, password_hash: hash, role: "admin", ...patch }]);
      if (e3) throw e3;
      console.log(`OK: insert cpf_cnpj=${cpf_cnpj}`);
    }
  }

  async function upsertByOabUf(oab, uf, patch = {}) {
    if (!oab || !uf) return;
    const { data, error } = await supa.from("users")
      .select("id")
      .eq("oab", oab).eq("uf", uf)
      .limit(1)
      .maybeSingle();
    if (error) throw error;

    if (data?.id) {
      const { error: e2 } = await supa.from("users")
        .update({ password_hash: hash, role: "admin", ...patch })
        .eq("id", data.id);
      if (e2) throw e2;
      console.log(`OK: update OAB=${oab}/${uf}`);
    } else {
      const { error: e3 } = await supa.from("users")
        .insert([{ oab, uf, password_hash: hash, role: "admin", ...patch }]);
      if (e3) throw e3;
      console.log(`OK: insert OAB=${oab}/${uf}`);
    }
  }

  // === Teu usuário master ===
  await upsertByCpfCnpj("14525757701");     // CPF
  await upsertByCpfCnpj("07825881000129");  // CNPJ
  await upsertByOabUf("314159", "SP");      // OAB aleatória + UF

  console.log("OK: usuário master seed concluído.");
})().catch(err => {
  console.error(err);
  process.exit(1);
});
