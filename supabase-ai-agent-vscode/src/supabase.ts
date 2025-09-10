import { createClient } from "@supabase/supabase-js";
import "dotenv/config";

const url = process.env.SUPABASE_URL!;
const serviceKey = process.env.SUPABASE_SERVICE_ROLE!;

if (!url || !serviceKey) {
  throw new Error("Configure SUPABASE_URL e SUPABASE_SERVICE_ROLE no .env");
}

export const supabase = createClient(url, serviceKey, {
  auth: { persistSession: false }
});
