terraform {
  required_version = "= 1.9.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.24.0"
    }
  }
}

provider "aws" {
  region  = "ap-northeast-1"
  profile = "default"
}
