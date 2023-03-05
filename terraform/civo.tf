# data "civo_size" "small" {
#   filter {
#     key    = "type"
#     values = ["kubernetes"]
#   }

#   sort {
#     key       = "ram"
#     direction = "asc"
#   }
# }

# resource "civo_firewall" "soal_one_staging" {
#   name = "soal-one-staging"
# }

# resource "civo_kubernetes_cluster" "soal_one_staging" {
#   name         = "staging"
#  applications = "metrics-server"
#   firewall_id  = civo_firewall.soal_one_staging.id
#   pools {
#     label      = "default" // Optional
#     size       = element(data.civo_size.small.sizes, 0).name
#     node_count = 5
#   }
# }
