import { defineConfig, loadEnv } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, process.cwd(), '')

  const allowedHostsRaw = env.VITE_ALLOWED_HOSTS || 'localhost'
  const allowedHosts = allowedHostsRaw.split(',').map(host => host.trim())

  return {
    plugins: [react()],
    server: {
      allowedHosts: allowedHosts,
      host: '0.0.0.0',
      port: 80
    }
  }
})