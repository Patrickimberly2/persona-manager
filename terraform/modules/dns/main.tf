terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

resource "cloudflare_zone" "this" {
  account_id = var.cloudflare_account_id
  zone       = var.zone_name
  plan       = var.plan
}

resource "cloudflare_zone_dnssec" "this" {
  zone_id = cloudflare_zone.this.id
}

resource "cloudflare_record" "prod" {
  zone_id = cloudflare_zone.this.id
  name    = var.prod_hostname
  type    = var.prod_record_type
  value   = var.prod_target
  proxied = var.proxied
  ttl     = var.ttl
}

resource "cloudflare_record" "staging" {
  zone_id = cloudflare_zone.this.id
  name    = var.staging_hostname
  type    = var.staging_record_type
  value   = var.staging_target
  proxied = var.proxied
  ttl     = var.ttl
}

output "zone_id" {
  description = "Cloudflare zone identifier"
  value       = cloudflare_zone.this.id
}

output "dnssec_status" {
  description = "DNSSEC status for the zone"
  value       = cloudflare_zone_dnssec.this.status
}

output "prod_record" {
  description = "Production record name and target"
  value = {
    name   = cloudflare_record.prod.name
    target = cloudflare_record.prod.value
    type   = cloudflare_record.prod.type
  }
}

output "staging_record" {
  description = "Staging record name and target"
  value = {
    name   = cloudflare_record.staging.name
    target = cloudflare_record.staging.value
    type   = cloudflare_record.staging.type
  }
}

output "uptime_monitors" {
  description = "Identifiers for uptime monitors"
  value = {
    prod    = cloudflare_load_balancer_monitor.prod.id
    staging = cloudflare_load_balancer_monitor.staging.id
  }
}
