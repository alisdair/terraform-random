variable "bytes" {
  default = 12
}

variable "number" {
  default = 2
}

resource "random_id" "random" {
  keepers {
    uuid = "${uuid()}"
  }

  byte_length = "${var.bytes}"
  
  count = "${var.number}"
}

output "random" {
  value = "${random_id.random.*.hex}"
}
