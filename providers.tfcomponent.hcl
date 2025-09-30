required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.2.3"
    }
    terraform = {
      source = "terraform.io/builtin/terraform"
    #   version = ">1.10"
    }
}

# Setting "this" as the alias name
provider "null" "this" {
    # config {
    # not needed to the null provider  
    # }
}

provider "terraform" "this" {
    # config {
    # not needed to the terraform provider
    # }
}