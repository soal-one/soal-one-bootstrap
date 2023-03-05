# waifu.plus
resource "digitalocean_record" "soal_one_wildcard" {
  domain = digitalocean_domain.soal_one.name
  type   = "A"
  value  = "161.35.252.34"
  name   = "*"
}

resource "digitalocean_domain" "soal_one" {
  name = "soal.one"
}
