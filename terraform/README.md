# Terraform infrastructure

This folder provisions DNS and hosting for production and staging. Remote state is expected to live in an S3-compatible backend (DynamoDB locking recommended). Apply from each environment directory.

## Remote state

1. Copy `backend-example.hcl` to `backend.hcl` per environment and fill in your backend values.
2. Initialize with: `terraform -chdir=terraform/environments/<env> init -backend-config=../backend-example.hcl`.

## Providers

- Cloudflare manages DNS, DNSSEC, HTTPS/HSTS enforcement, and A/CNAME records plus uptime monitors.
- Vercel manages hosting projects, custom domains, and environment-scoped secrets.

Certificate issuance and HTTPS enforcement rely on Cloudflare (DNS-01 for managed certificates). HSTS can be toggled with preload/subdomain settings through module variables when you are ready to enforce across the zone.

## Workflows

- `prod` environment deploys from `main` or tags.
- `staging` environment deploys from the `staging` branch.
- Secrets are passed via environment variables in the CI workflows (see `.github/workflows`).
- Uptime and certificate monitoring leverage Cloudflare monitors; wire notifications via the Cloudflare dashboard or API using the monitor IDs output from the modules.
