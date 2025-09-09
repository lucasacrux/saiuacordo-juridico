import pool from "../config/db.js";

export async function listarProcessos(req, res) {
  try {
    const [rows] = await pool.query("SELECT id, cnj, partes, foro, vara, sistema, situacao, ultimaMov FROM processos ORDER BY id DESC LIMIT 50");
    res.json(rows);
  } catch (error) {
    console.error("[listarProcessos] erro:", error);
    res.status(500).json({ message: "Erro ao consultar processos" });
  }
}
