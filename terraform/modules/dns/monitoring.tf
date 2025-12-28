resource "cloudflare_load_balancer_monitor" "prod" {
  account_id     = var.cloudflare_account_id
  description    = "Uptime monitor for production"
  method         = var.monitor_method
  path           = var.monitor_path
  expected_codes = "200"
  interval       = var.monitor_interval
  retries        = 2
  timeout        = 5
  type           = "https"
  port           = 443

  header {
    header = "Host"
    values = [var.prod_hostname]
  }
}

resource "cloudflare_load_balancer_monitor" "staging" {
  account_id     = var.cloudflare_account_id
  description    = "Uptime monitor for staging"
  method         = var.monitor_method
  path           = var.monitor_path
  expected_codes = "200"
  interval       = var.monitor_interval
  retries        = 2
  timeout        = 5
  type           = "https"
  port           = 443

  header {
    header = "Host"
    values = [var.staging_hostname]
  }
}
