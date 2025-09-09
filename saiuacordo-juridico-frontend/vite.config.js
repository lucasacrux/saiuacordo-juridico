// vite.config.ts (ou .js)
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    host: '0.0.0.0',
    port: 5175,
    strictPort: true,
    proxy: {
      // TODO: toda a API passa pelo APP (:8010). Ele mesmo proxyará para o raspador (:8000).
      '/api': {
        target: 'http://localhost:8010',
        changeOrigin: true,
        secure: false,
      },

      // API de pessoas (quando você usa a rota relativa "/pessoas" no front)
      // Ex.: /pessoas?cpf=...  ->  https://datahub.resolvecontas.com.br/api/pessoas?cpf=...
      '/pessoas': {
        target: 'https://datahub.resolvecontas.com.br',
        changeOrigin: true,
        secure: false,
        rewrite: (path) => path.replace(/^\/pessoas/, '/api/pessoas'),
      },
    },
  },
})
