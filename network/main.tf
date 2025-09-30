variable "network_name" {
  type = string
}

variable "prefix" {
  type = string
}

resource "terraform_data" "network" {
  input = "${var.prefix}-${var.network_name}"
}

resource "null_resource" "router" {
}


resource "null_resource" "gateway" {
}
