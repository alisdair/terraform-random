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
}

data "null_data_source" "foo" {
  inputs = {
    bar = "boop"
  }
}

output "random" {
  value = random_id.random.*.hex
}
