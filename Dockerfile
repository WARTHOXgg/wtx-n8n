
# n8n Render Dockerfile
FROM n8nio/n8n:latest
# Render sets PORT, we ensure n8n listens on it
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0
# Store data in /data which is mounted as persistent disk on Render
VOLUME ["/data"]
# Healthcheck
HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD curl -fsS http://localhost:${PORT}/healthz || exit 1
