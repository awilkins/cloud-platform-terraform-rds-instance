terraform {
  required_version = ">= 1.2.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "< 5.0.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}
