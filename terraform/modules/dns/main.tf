terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

resource "cloudflare_zone" "this" {
  count = var.manage_zone ? 1 : 0

  account_id = var.cloudflare_account_id
  zone       = var.zone_name
  plan       = var.plan
}

data "cloudflare_zone" "selected" {
  count = var.manage_zone ? 0 : 1

  name       = var.zone_name
  account_id = var.cloudflare_account_id
}

locals {
  zone_id = var.manage_zone ? cloudflare_zone.this[0].id : data.cloudflare_zone.selected[0].id
}

resource "cloudflare_zone_dnssec" "this" {
  count = var.manage_zone_settings ? 1 : 0

  zone_id = local.zone_id
}

resource "cloudflare_record" "prod" {
  count = var.create_prod_record ? 1 : 0

  zone_id = local.zone_id
  name    = var.prod_hostname
  type    = var.prod_record_type
  value   = var.prod_target
  proxied = var.proxied
  ttl     = var.ttl
}

resource "cloudflare_record" "staging" {
  count = var.create_staging_record ? 1 : 0

  zone_id = local.zone_id
  name    = var.staging_hostname
  type    = var.staging_record_type
  value   = var.staging_target
  proxied = var.proxied
  ttl     = var.ttl
}

output "zone_id" {
  description = "Cloudflare zone identifier"
  value       = local.zone_id
}

output "dnssec_status" {
  description = "DNSSEC status for the zone"
  value       = try(cloudflare_zone_dnssec.this[0].status, null)
}

output "prod_record" {
  description = "Production record name and target"
  value = {
    name   = try(cloudflare_record.prod[0].name, null)
    target = try(cloudflare_record.prod[0].value, null)
    type   = try(cloudflare_record.prod[0].type, null)
  }
}

output "staging_record" {
  description = "Staging record name and target"
  value = {
    name   = try(cloudflare_record.staging[0].name, null)
    target = try(cloudflare_record.staging[0].value, null)
    type   = try(cloudflare_record.staging[0].type, null)
  }
}

output "uptime_monitors" {
  description = "Identifiers for uptime monitors"
  value = {
    prod    = cloudflare_load_balancer_monitor.prod.id
    staging = cloudflare_load_balancer_monitor.staging.id
  }
}
