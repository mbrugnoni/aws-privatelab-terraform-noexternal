terraform {
  cloud {
    organization = "org-ce3NyygJzkY8QcPK"
    workspaces {
      name = "aws-cmdlineonly-network"
    }
  }
required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = ">= 3.73.0"
  }
}
}
provider "aws" {
#   region = var.aws_region
	region = "us-east-1"
}
