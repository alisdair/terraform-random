variable "bytes" {
  default = 13
}

variable "number" {
  default = 5
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
