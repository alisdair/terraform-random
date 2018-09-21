variable "bytes" {
  default = 120
}

resource "random_id" "random" {
  keepers {
    uuid = "${uuid()}"
  }

  byte_length = "${var.bytes}"
}

output "random" {
  value = "${random_id.random.hex}"
}
