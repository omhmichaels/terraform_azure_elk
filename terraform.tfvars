### AZ Resource Group Configuration ###
rg_tags = {
  name        = "elk_stack"
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
  name           = "public"
  terraform      = "true"
  address_prefix = "10.0.1.0/24"
  security_group = ""
}

subnet_private_tags = {
  name           = "private"
  terraform      = "true"
  address_prefix = "10.0.2.0/24"
  security_group = ""
}

jumpbox_nic = {
  internal_dns_name_label = "jumpbox"
  ip_configuration_name = "jumpbox"
  private_ip_address_allocation = "Static"
  private_ip_address = "10.0.0.2"
}

jumpbox_tags = {
  size = 
  custom_data = 
  os_name = 
  os_caching = "ReadWrite"
  storage_account_type = 
  image_publisher = "Canonical"
  image_offer = "UbuntuServer"
  image_sku = "18.04-LTS"
  image_tags = "latest"
  computer_name = "jumpbox"
  user = "jumper" 
  disable_password_authentication = "true" 
  public_key = "~/.ssh/jumpbox.pub"

}

jumpbox_public_ip = {
  allocation_method = "Static"
}