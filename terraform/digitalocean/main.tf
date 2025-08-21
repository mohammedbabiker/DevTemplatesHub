terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "web" {
  image    = var.image
  name     = var.name
  region   = var.region
  size     = var.size
  tags     = var.tags
  ssh_keys = var.ssh_keys
  backups  = false
  # only if backups is true
  # backup_policy {
  #   plan    = "weekly"
  #   weekday = "TUE"
  #   hour    = 8
  # }
}