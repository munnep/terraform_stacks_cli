variable "server_name" {
  type = string
}

variable "network_name" {
  type = string
}

variable "prefix" {
  type = string
}

resource "terraform_data" "server" {
  input = "${var.prefix}-${var.server_name}-${var.network_name}"
}

resource "null_resource" "disk" {
}


