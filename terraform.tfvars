### AZ Resource Group Configuration ###
rg_tags = {
  name        = "elk"
  location    = "westus2"
  terraform   = "true"
  description = "Resource Group for Elk Stack"
}

vnet_tags = {
  address_space = "10.0.0.0/21"
  terraform     = "true"
  dns_servers   = ""
}

subnet_public_tags = {
  name             = "public"
  terraform        = "true"
  address_prefixes = "10.0.1.0/24"
  security_group   = ""
}

subnet_private_tags = {
  name             = "private"
  terraform        = "true"
  address_prefixes = "10.0.2.0/24"
  security_group   = ""
}
