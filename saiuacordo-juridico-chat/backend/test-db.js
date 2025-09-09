// test-db.js
require("dotenv").config();
const mysql = require("mysql2/promise");

(async () => {
  const cfg = {
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT || 3306),
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    connectTimeout: 15000,
  };

  console.log("Tentando conectar:", cfg.host, cfg.port, cfg.database);

  try {
    const conn = await mysql.createConnection(cfg);
    const [info] = await conn.query("SELECT DATABASE() AS db, NOW() AS now");
    console.log("✅ Conectado:", info[0]);

    const [tables] = await conn.query("SHOW TABLES");
    console.log("Tabelas (amostra):", tables.slice(0, 5));
    console.log("Total de tabelas:", tables.length);

    await conn.end();
    process.exit(0);
  } catch (e) {
    console.error("❌ ERRO:", e.code, e.message);
    process.exit(1);
  }
})();
