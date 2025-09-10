-- Exemplo simples de funções RPC "whitelistadas".
-- Rode no SQL Editor do Supabase (ajuste nomes de tabela/colunas).
-- Observação: manter em 'public' facilita a exposição via PostgREST.
-- Ajuste RLS/Policies conforme seu modelo de dados.

-- Atualiza email de um cliente
create or replace function public.update_customer_email(
  p_customer_id uuid,
  p_new_email text
)
returns void
language plpgsql
security invoker
as $$
begin
  update public.customers
    set email = p_new_email, updated_at = now()
  where id = p_customer_id;
end;
$$;

revoke all on function public.update_customer_email(uuid, text) from public;

-- Marca status de um acordo
create or replace function public.mark_agreement_status(
  p_agreement_id uuid,
  p_status text
)
returns void
language plpgsql
security invoker
as $$
begin
  update public.agreements
    set status = p_status::text, updated_at = now()
  where id = p_agreement_id;
end;
$$;

revoke all on function public.mark_agreement_status(uuid, text) from public;
