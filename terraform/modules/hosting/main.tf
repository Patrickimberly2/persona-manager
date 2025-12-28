terraform {
  required_providers {
    vercel = {
      source  = "vercel/vercel"
      version = "~> 1.0"
    }
  }
}

resource "vercel_project" "this" {
  name               = var.project_name
  root_directory     = var.root_directory
  framework          = var.framework
  serverless_function_region = var.serverless_function_region
  output_directory   = var.output_directory
  build_command      = var.build_command
  ignore_command     = var.ignore_command
  production_branch  = var.production_branch

  git_repository {
    type = var.git_provider
    repo = var.git_repository
  }
}

resource "vercel_project_domain" "production" {
  project_id = vercel_project.this.id
  domain     = var.production_domain
  redirect   = var.production_redirect
}

resource "vercel_project_domain" "staging" {
  project_id = vercel_project.this.id
  domain     = var.staging_domain
  redirect   = var.staging_redirect
}

resource "vercel_project_environment_variable" "staging" {
  for_each = var.staging_environment_variables

  project_id = vercel_project.this.id
  key        = each.key
  value      = each.value
  target     = ["preview"]
  type       = var.environment_variable_type
  sensitive  = true
}

resource "vercel_project_environment_variable" "production" {
  for_each = var.production_environment_variables

  project_id = vercel_project.this.id
  key        = each.key
  value      = each.value
  target     = ["production"]
  type       = var.environment_variable_type
  sensitive  = true
}

output "project_id" {
  description = "Hosting project id"
  value       = vercel_project.this.id
}

output "production_domain" {
  description = "Attached production domain"
  value       = vercel_project_domain.production.domain
}

output "staging_domain" {
  description = "Attached staging domain"
  value       = vercel_project_domain.staging.domain
}
