component "network" {
  source = "./network"
  inputs = {
    network_name = var.network_name
    prefix = var.prefix
  }

  providers = {
      null = provider.null.this
      terraform = provider.terraform.this
  }
}

component "server" {
  source = "./server"
  inputs = {
    server_name = var.server_name
    prefix = var.prefix
    network_name = component.network.network_name
  }

  providers = {
      null = provider.null.this
      terraform = provider.terraform.this
  }
}
