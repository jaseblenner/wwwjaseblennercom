terraform {
  required_version = ">= 1.3.9"

  required_providers {

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">=3.33.1"
    }
  }
}
