deployment "test" {

    inputs = {
      network_name = "my-network-2"
      server_name = "my-server-2"
      prefix = "test"
    }
}

deployment "prod" {

    inputs = {
      network_name = "my-network"
      server_name = "my-server"
      prefix = "prod"
    }
}
