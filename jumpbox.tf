# Public IP
resource "azurerm_public_ip" "jumpbox_ip" {
  name                = "${azurerm_resource_group.elk_rg.name}-public_ip"
  resource_group_name = azurerm_resource_group.elk_rg.name
  location            = azurerm_resource_group.elk_rg.location
  allocation_method   = var.jumpbox_ip["allocation_method"]
  tags = var.jumpbox_public_ip
}


# Create network interface
resource "azurerm_network_interface" "jumpbox_nic" {
  name                      = "${azurerm_resource_group.elk_rg.name}-jumpbox_nic"
  location                  = azurerm_resource_group.elk_rg.location
  resource_group_name       = azurerm_resource_group.elk_rg.name
  internal_dns_name_label   = var.jumpbox_nic["internal_dns_name_label"]
  #depends_on = [azurerm_public_ip.jumpbox_ip,azurerm_resource_group.elk_rg]

  ip_configuration {
    name                          = var.jumpbox_nic["ip_configuration_name"]
    subnet_id                     = 
    private_ip_address_allocation = var.jumpbox_nic["private_ip_address_allocation"]
    private_ip_address            = var.jumpbox_nic["private_ip_address"]
    public_ip_address_id          = azurerm_public_ip.jumpbox_ip.id

  }
  tags = var.jumpbox_nic
}

resource "azurerm_network_interface_security_group_association" "jumpbox" {
  network_interface_id      = azurerm_network_interface.jumpbox_nic.id
  network_security_group_id = azurerm_network_security_group.public_sg.id
  #depends_on = [azurerm_network_interface.jumpbox_nic,azurerm_network_interface_security_group_association.jumpbox]
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "jumpbox" {
  name                  = "${azurerm_resource_group.elk_rg.name}-jumpbox"
  location              = azurerm_resource_group.elk_rg.location
  resource_group_name   = azurerm_resource_group.elk_rg.name
  network_interface_ids = [azurerm_network_interface.jumpbox_nic.id]
  size                  = var.jumpbox_tags["size"]
  custom_data           = var.jumpbox_tags["custom_data"]

  os_disk {
    name              = jumpbox_tags["os_name"]
    caching           = jumpbox_tags["os_caching"]
    storage_account_type = jumpbox_tags["storage_account_type"]
  }

  source_image_reference {
    publisher = jumpbox_tags["image_publisher"]
    offer     = jumpbox_tags["image_offer"]
    sku       = jumpbox_tags["image_sku"]
    version   = jumpbox_tags["image_version"]
  }

  computer_name  = jumpbox_tags["computer_name"]
  admin_username = jumpbox_tags["user"]
  disable_password_authentication = jumpbox["disable_password_authentication"]

  admin_ssh_key {
    username       = jumpbox_tags["user"]
    public_key     = jumpbox_tags["public_key"]
  }
  #depends_on = [azurerm_network_interface_security_group_association.jumpbox]

#  boot_diagnostics {
#    storage_account_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
#  }

  tags = var.jumpbox_tags
}
