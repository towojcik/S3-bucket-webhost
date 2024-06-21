terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.39.0"
    }
  }
}

provider "aws" {
<<<<<<< HEAD
  region = "eu-east-1"
}
=======
  region = "eu-central-1"
}
>>>>>>> 934d16a (Add Jenkinsfile)
