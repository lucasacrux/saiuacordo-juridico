import { z } from "zod";
import { supabase } from "./supabase.js";

// === Definições (zod) para validação no runtime ===
export const UpdateCustomerEmail = z.object({
  customer_id: z.string().uuid(),
  new_email: z.string().email()
});

export const MarkAgreementStatus = z.object({
  agreement_id: z.string().uuid(),
  status: z.enum(["active","broken","paid"])
});

// === Execução (callers) — chamam RPCs whitelistadas ===
export async function rpc_update_customer_email(args: z.infer<typeof UpdateCustomerEmail>) {
  const { data, error } = await supabase.rpc("update_customer_email", {
    p_customer_id: args.customer_id,
    p_new_email: args.new_email
  });
  if (error) throw error;
  return data ?? { ok: true };
}

export async function rpc_mark_agreement_status(args: z.infer<typeof MarkAgreementStatus>) {
  const { data, error } = await supabase.rpc("mark_agreement_status", {
    p_agreement_id: args.agreement_id,
    p_status: args.status
  });
  if (error) throw error;
  return data ?? { ok: true };
}

// === Tabela de roteamento ===
export const TOOL_ROUTER = {
  rpc_update_customer_email: {
    schema: {
      name: "rpc_update_customer_email",
      description: "Atualiza o e-mail de um cliente pelo ID (RPC: update_customer_email).",
      parameters: {
        type: "object",
        properties: {
          customer_id: { type: "string", description: "UUID do cliente." },
          new_email: { type: "string", description: "Novo e-mail válido." }
        },
        required: ["customer_id","new_email"]
      }
    },
    zod: UpdateCustomerEmail,
    run: rpc_update_customer_email
  },
  rpc_mark_agreement_status: {
    schema: {
      name: "rpc_mark_agreement_status",
      description: "Marca o status de um acordo (RPC: mark_agreement_status).",
      parameters: {
        type: "object",
        properties: {
          agreement_id: { type: "string", description: "UUID do acordo." },
          status: { type: "string", enum: ["active","broken","paid"] }
        },
        required: ["agreement_id","status"]
      }
    },
    zod: MarkAgreementStatus,
    run: rpc_mark_agreement_status
  }
} as const;

export type ToolName = keyof typeof TOOL_ROUTER;
export const TOOLS_FOR_OPENAI = Object.values(TOOL_ROUTER).map(t => ({
  type: "function",
  function: t.schema
}));
