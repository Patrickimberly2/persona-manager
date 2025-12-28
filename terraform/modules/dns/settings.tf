resource "cloudflare_zone_settings_override" "https" {
  zone_id = cloudflare_zone.this.id

  settings {
    ssl               = "full"
    always_use_https  = "on"
    automatic_https_rewrites = "on"
    min_tls_version   = "1.2"
    tls_1_3           = "on"
    opportunistic_encryption = "on"
    http3             = "on"

    hsts {
      enabled            = true
      include_subdomains = var.hsts_include_subdomains
      preload            = var.hsts_preload
      max_age            = var.hsts_max_age
    }
  }
}
