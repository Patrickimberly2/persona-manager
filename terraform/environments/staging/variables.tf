variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "vercel_api_token" {
  description = "Vercel API token"
  type        = string
  sensitive   = true
}

variable "vercel_team" {
  description = "Vercel team id"
  type        = string
}

variable "cloudflare_account_id" {
  description = "Cloudflare account id"
  type        = string
}

variable "zone_name" {
  description = "Primary DNS zone"
  type        = string
}

variable "cloudflare_plan" {
  description = "Cloudflare plan"
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
  description = "Production record target"
  type        = string
}

variable "staging_target" {
  description = "Staging record target"
  type        = string
}

variable "prod_record_type" {
  description = "Production record type"
  type        = string
  default     = "CNAME"
}

variable "staging_record_type" {
  description = "Staging record type"
  type        = string
  default     = "CNAME"
}

variable "cloudflare_proxied" {
  description = "Whether Cloudflare proxies traffic"
  type        = bool
  default     = true
}

variable "dns_ttl" {
  description = "DNS TTL value"
  type        = number
  default     = 300
}

variable "project_prefix" {
  description = "Prefix for project naming"
  type        = string
  default     = "persona-manager"
}

variable "git_provider" {
  description = "Git provider"
  type        = string
  default     = "github"
}

variable "git_repository" {
  description = "Git repository identifier"
  type        = string
}

variable "root_directory" {
  description = "Directory to build"
  type        = string
  default     = ""
}

variable "framework" {
  description = "Framework hint for hosting provider"
  type        = string
  default     = "static"
}

variable "serverless_function_region" {
  description = "Serverless region"
  type        = string
  default     = "iad1"
}

variable "output_directory" {
  description = "Output directory"
  type        = string
  default     = "dist"
}

variable "build_command" {
  description = "Build command"
  type        = string
  default     = "npm run build"
}

variable "ignore_command" {
  description = "Ignore command"
  type        = string
  default     = ""
}

variable "production_branch" {
  description = "Production branch name"
  type        = string
  default     = "main"
}

variable "staging_environment_variables" {
  description = "Staging environment variables map"
  type        = map(string)
  default     = {}
  sensitive   = true
}

variable "production_environment_variables" {
  description = "Production environment variables map"
  type        = map(string)
  default     = {}
  sensitive   = true
}

variable "environment_variable_type" {
  description = "How environment variables are stored"
  type        = string
  default     = "encrypted"
}
