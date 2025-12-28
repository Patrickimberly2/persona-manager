terraform {
  required_version = ">= 1.6.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
    vercel = {
      source  = "vercel/vercel"
      version = "~> 1.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "vercel" {
  api_token = var.vercel_api_token
  team      = var.vercel_team
}

module "dns" {
  source                 = "../../modules/dns"
  cloudflare_account_id  = var.cloudflare_account_id
  zone_name              = var.zone_name
  plan                   = var.cloudflare_plan
  prod_hostname          = var.prod_hostname
  staging_hostname       = var.staging_hostname
  prod_target            = var.prod_target
  staging_target         = var.staging_target
  prod_record_type       = var.prod_record_type
  staging_record_type    = var.staging_record_type
  proxied                = var.cloudflare_proxied
  ttl                    = var.dns_ttl
}

module "hosting" {
  source                           = "../../modules/hosting"
  project_name                     = "${var.project_prefix}-staging"
  git_provider                     = var.git_provider
  git_repository                   = var.git_repository
  root_directory                   = var.root_directory
  framework                        = var.framework
  serverless_function_region       = var.serverless_function_region
  output_directory                 = var.output_directory
  build_command                    = var.build_command
  ignore_command                   = var.ignore_command
  production_branch                = var.production_branch
  production_domain                = var.prod_hostname
  staging_domain                   = var.staging_hostname
  production_redirect              = ""
  staging_redirect                 = ""
  staging_environment_variables    = var.staging_environment_variables
  production_environment_variables = var.production_environment_variables
  environment_variable_type        = var.environment_variable_type
}
