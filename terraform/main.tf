terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.24.0"
    }
    vultr = {
      source  = "vultr/vultr"
      version = "2.12.0"
    }

  }
}

provider "digitalocean" {
}

provider "vultr" {
}
