import express from "express";
import { listarProcessos } from "../controllers/processoController.js";

const router = express.Router();

router.get("/", listarProcessos);

export default router;
