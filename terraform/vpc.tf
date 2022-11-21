resource "digitalocean_vpc" "soal_one_staging" {
  name     = "soal-one-staging"
  region   = "nyc1"
  ip_range = "10.1.0.0/16"
}
