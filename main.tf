variable "bytes" {
  default = 12
}

variable "number" {
  default = 5
}

resource "random_id" "random" {
  keepers = {
    uuid = uuid()
    foo  = data.null_data_source.foo.outputs.bar
  }

  byte_length = var.bytes

  count = var.number
  depends_on = [ data.null_data_source.foo ]

  provisioner "local-exec" {
    command = "sleep ${5 * count.index} && echo Done!"
  }
}

output "random" {
  value = random_id.random.*.hex
}
