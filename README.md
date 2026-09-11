# docker-security-hardening-templates

Battle-tested, minimal, non-root multi-stage Dockerfile templates.

## Hardening Standards
- Non-root user execution (UID: 10001)
- Minimal base images (Alpine / Distroless)
- Multi-stage build artifact isolation
