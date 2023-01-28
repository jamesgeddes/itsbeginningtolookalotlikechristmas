variable "service" {
  description = "The name of the service that we are working on"
  type        = string
  default     = "itsbeginningtolookalotlikechristmas"
}

variable "service_domain" {
  description = "The domain name that the project will be publicly available at"
  type        = string
  default     = "itsbeginningtolookalotlike.christmas"
}

variable "region" {
  description = "The AWS region that we will be deploying into"
  type        = string
  default     = "eu-west-2"
}

variable "environment" {
  description = "The name of the environment that we are deploying to"
  type        = string
  default     = "prod"
}

variable "team" {
  description = "The name of the team that owns this service"
  type        = string
  default     = "awesomesawse"
}

variable "org_name" {
  description = "The name of the organisation we are working in"
  type        = string
  default     = "geddes"
}