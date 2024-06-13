terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.39.0"
    }
  }
  backend "http" {
  }
}

provider "aws" {
  # Configuration options
}