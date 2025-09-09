import "dotenv/config";
import mysql from "mysql2/promise";

async function main(){
  const conn = await mysql.createConnection({
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT || 3306),
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
  });
  const [rows] = await conn.query("SELECT 1 as ok");
  console.log("Conexão OK:", rows[0]);
  await conn.end();
}
main().catch(e=>{
  console.error("Falha ao conectar:", e.message);
  process.exit(1);
});
