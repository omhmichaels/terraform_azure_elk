# Public IP
resource "azurerm_public_ip" "jumpbox_ip" {
  name                = "${azurerm_resource_group.elk.name}-public_ip"
  resource_group_name = azurerm_resource_group.elk.name
  location            = azurerm_resource_group.elk.location
  allocation_method   = var.jumpbox_ip["allocation_method"]
  tags                = var.jumpbox_ip
}


# Create network interfaces
resource "azurerm_network_interface" "jumpbox_nic" {
  name                    = "${azurerm_resource_group.elk.name}-jumpbox_nic"
  location                = azurerm_resource_group.elk.location
  resource_group_name     = azurerm_resource_group.elk.name
  internal_dns_name_label = var.jumpbox_nic["internal_dns_name_label"]
  #depends_on = [azurerm_public_ip.jumpbox_ip,azurerm_resource_group.elk]

  ip_configuration {
    name                          = var.jumpbox_nic["ip_configuration_name"]
    subnet_id                     = azurerm_subnet.subnet_private.id
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
  name                  = "${azurerm_resource_group.elk.name}-jumpbox"
  location              = azurerm_resource_group.elk.location
  resource_group_name   = azurerm_resource_group.elk.name
  network_interface_ids = [azurerm_network_interface.jumpbox_nic.id]
  size                  = var.jumpbox_tags["size"]
  custom_data           = filebase64(var.jumpbox_tags["custom_data"])

  os_disk {
    name                 = var.jumpbox_tags["os_name"]
    caching              = var.jumpbox_tags["os_caching"]
    storage_account_type = var.jumpbox_tags["storage_account_type"]
  }

  source_image_reference {
    publisher = var.jumpbox_tags["image_publisher"]
    offer     = var.jumpbox_tags["image_offer"]
    sku       = var.jumpbox_tags["image_sku"]
    version   = var.jumpbox_tags["image_version"]
  }

  computer_name                   = var.jumpbox_tags["computer_name"]
  admin_username                  = var.jumpbox_tags["user"]
  disable_password_authentication = var.jumpbox_tags["disable_password_authentication"]

  admin_ssh_key {
    username   = var.jumpbox_tags["user"]
    public_key = file(var.jumpbox_tags["public_key"])
  }
  #depends_on = [azurerm_network_interface_security_group_association.jumpbox]

  #  boot_diagnostics {
  #    storage_account_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
  #  }

  tags = var.jumpbox_tags
}
