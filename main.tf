terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "random" {
  length           = 64
  special          = false
}

output "bucket_name" {
    value = "random"
}