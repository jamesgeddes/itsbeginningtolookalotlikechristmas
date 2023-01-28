terraform {
  required_version = "~>1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.51.0"
    }

    dockerhub = {
      source  = "BarnabyShearer/dockerhub"
      version = "~> 0.0.15"
    }

  }

  cloud {
    organization = var.org_name

    workspaces {
      name = "prod-eu-west"
    }
  }
}