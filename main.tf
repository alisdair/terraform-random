# Comments

variable "bytes" {
  default = 10
}

variable "number" {
  default = 1
}

resource "random_id" "random" {
  keepers {
    uuid = "${uuid()}"
  }

  byte_length = "${var.bytes}"
  
  count = "${var.number}"
}

output "random" {
  value = "rand-${random_id.random.*.hex}"
}
