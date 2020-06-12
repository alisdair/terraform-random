variable "bytes" {
  default = 12
}

variable "number" {
  default = 5
}

resource "randomm_id" "random" {
  keepers = {
    uuid = uuid()
  }

  byte_length = var.bytes

  count = var.number
}

output "random" {
  value = random_id.random.*.hex
}
