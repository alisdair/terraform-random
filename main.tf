resource "random_id" "random" {
  keepers {
    uuid = "${uuid()}"
  }

  byte_length = 10
}

output "random" {
  value = "${random_id.random.hex}"
}

terraform {
  backend "atlas" {
    name = "alisdair-v2/s3-random"
  }
}
