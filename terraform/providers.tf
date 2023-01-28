provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

  default_tags {
    tags = {
      Environment = var.environment
      Team        = var.team
      Service     = var.service
    }
  }
}

provider "dockerhub" {
  username = var.dockerhub_username
  password = var.dockerhub_password
}