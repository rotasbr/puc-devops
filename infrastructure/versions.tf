terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.27.0"
    }
  }

  backend "s3" {
    profile = "terraform-pucminas"
    bucket  = "terraform-pucminas1"
    key     = "state/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }

}