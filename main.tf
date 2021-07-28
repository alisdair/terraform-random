variable "bytes" {
  default = 12
}

variable "number" {
  default = 5
}

resource "random_id" "random" {
  keepers = {
    uuid = uuid()
  }

  byte_length = var.bytes

  count = var.number

  provisioner "local-exec" {
    command = "sleep ${5 * count.index} && echo Done!"
  }
  
  lifecycle {
    create_before_destroy = true
  }
}

output "random" {
  value = random_id.random.*.hex
}
