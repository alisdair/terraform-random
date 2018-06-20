resource "random_id" "random" {
  keepers {
    uuid = "${uuid()}"
  }

  byte_length = "bob"
}

output "random" {
  value = "${random_id.random.hex}"
}
