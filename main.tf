resource "random_id" "random" {
  keepers {
    uuid = "${uuid()}"
  }

  byte_length = 8
}

output "random" {
  value = "${random_id.random.hex}"
}

terraform {
  backend "s3" {
    bucket = "milkdiarmid-tf-state"
    key = "terraform-random"
    region = "us-east-2"
  }
}
