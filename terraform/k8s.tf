resource "digitalocean_kubernetes_cluster" "staging" {
  name   = "soal-one-staging"
  region = "nyc1"

  auto_upgrade = true
  version      = "1.24.4-do.0"

  vpc_uuid = digitalocean_vpc.soal_one_staging.id

  node_pool {
    name       = "small"
    size       = "s-1vcpu-2gb"
    node_count = 2

    auto_scale = true
    min_nodes  = 2
    max_nodes  = 4
  }
}