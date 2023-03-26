resource "digitalocean_kubernetes_cluster" "staging" {
  name   = "soal-one-staging"
  region = "nyc1"

  auto_upgrade = true
  version      = "1.25.4-do.0"

  vpc_uuid = digitalocean_vpc.soal_one_staging.id

  node_pool {
    name       = "small"
    size       = "s-2vcpu-4gb-intel"
    node_count = 3

    auto_scale = true
    min_nodes  = 3
    max_nodes  = 6
  }
}

resource "digitalocean_project_resources" "staging" {
  project = digitalocean_project.staging.id
  resources = [
    digitalocean_kubernetes_cluster.staging.urn,
  ]
}

# resource "vultr_kubernetes" "staging" {
#   region  = "atl"
#   label   = "staging"
#   version = "v1.25.4+1"

#   node_pools {
#     node_quantity = 3
#     plan          = "vc2-2c-4gb"
#     label         = "default"
#     auto_scaler   = true
#     min_nodes     = 3
#     max_nodes     = 5
#   }
# }
