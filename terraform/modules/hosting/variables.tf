variable "project_name" {
  description = "Hosting project name"
  type        = string
}

variable "git_provider" {
  description = "Git provider name (e.g., github)"
  type        = string
  default     = "github"
}

variable "git_repository" {
  description = "Repository in <org>/<repo> form"
  type        = string
}

variable "root_directory" {
  description = "Subdirectory to build"
  type        = string
  default     = ""
}

variable "framework" {
  description = "Framework hint"
  type        = string
  default     = "static"
}

variable "serverless_function_region" {
  description = "Default serverless region"
  type        = string
  default     = "iad1"
}

variable "output_directory" {
  description = "Directory with build artifacts"
  type        = string
  default     = "dist"
}

variable "build_command" {
  description = "Command used to build the project"
  type        = string
  default     = "npm run build"
}

variable "ignore_command" {
  description = "Command that decides whether to skip builds"
  type        = string
  default     = ""
}

variable "production_branch" {
  description = "Branch that deploys to production"
  type        = string
  default     = "main"
}

variable "production_domain" {
  description = "Primary production domain"
  type        = string
}

variable "staging_domain" {
  description = "Primary staging domain"
  type        = string
}

variable "production_redirect" {
  description = "Optional redirect for production domain"
  type        = string
  default     = ""
}

variable "staging_redirect" {
  description = "Optional redirect for staging domain"
  type        = string
  default     = ""
}

variable "staging_environment_variables" {
  description = "Map of staging environment variables"
  type        = map(string)
  default     = {}
}

variable "production_environment_variables" {
  description = "Map of production environment variables"
  type        = map(string)
  default     = {}
}

variable "environment_variable_type" {
  description = "Environment variable storage type"
  type        = string
  default     = "encrypted"
}
