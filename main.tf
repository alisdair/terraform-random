resource "random_id" "random" {
  keepers {
    uuid = "${uuid()}"
  }

  byte_length = 11
}

output "random" {
  value = "r-${random_id.random.hex}"
}
