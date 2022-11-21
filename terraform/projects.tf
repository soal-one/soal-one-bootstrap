resource "digitalocean_project" "staging" {
  name        = "staging"
  description = "Pre-production environment for soal.one"
  purpose     = "Staging"
  environment = "staging"
}

resource "digitalocean_project" "production" {
  name        = "production"
  description = "production environment for soal.one"
  purpose     = "production"
  environment = "production"
}
