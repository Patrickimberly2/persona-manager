variable "zone_name" {
  description = "Root domain name for the zone"
  type        = string
}

variable "cloudflare_account_id" {
  description = "Cloudflare account identifier"
  type        = string
}

variable "plan" {
  description = "Cloudflare plan name"
  type        = string
  default     = "free"
}

variable "prod_hostname" {
  description = "Production hostname"
  type        = string
}

variable "staging_hostname" {
  description = "Staging hostname"
  type        = string
}

variable "prod_target" {
  description = "Target value for the production record"
  type        = string
}

variable "staging_target" {
  description = "Target value for the staging record"
  type        = string
}

variable "prod_record_type" {
  description = "Record type for production"
  type        = string
  default     = "CNAME"
}

variable "staging_record_type" {
  description = "Record type for staging"
  type        = string
  default     = "CNAME"
}

variable "proxied" {
  description = "Whether Cloudflare should proxy requests"
  type        = bool
  default     = true
}

variable "ttl" {
  description = "DNS record TTL"
  type        = number
  default     = 3600
}

variable "hsts_include_subdomains" {
  description = "Whether to include subdomains in HSTS"
  type        = bool
  default     = false
}

variable "hsts_preload" {
  description = "Whether to request preload status"
  type        = bool
  default     = false
}

variable "hsts_max_age" {
  description = "HSTS max-age in seconds"
  type        = number
  default     = 31536000
}

variable "monitor_method" {
  description = "HTTP method for uptime checks"
  type        = string
  default     = "GET"
}

variable "monitor_path" {
  description = "Path to check for uptime monitoring"
  type        = string
  default     = "/"
}

variable "monitor_interval" {
  description = "Interval between monitors in seconds"
  type        = number
  default     = 60
}
