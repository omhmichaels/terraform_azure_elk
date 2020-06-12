provider "azurerm" {
  features {}

}


### RESOURCE GROUP ### 
resource "azurerm_resource_group" "elk_rg" {
  name     = var.rg_tags["name"]
  location = var.rg_tags["location"]
  tags     = var.rg_tags
}


resource "azurerm_network_ddos_protection_plan" "elk_ddos_plan" {
  name                = "${var.rg_tags["name"]}-ddos_plan"
  location            = azurerm_resource_group.elk_rg.location
  resource_group_name = azurerm_resource_group.elk_rg.name
}




### VIRTUAL NETWORK ### 
resource "azurerm_virtual_network" "elk_vnet" {
  name                = "${azurerm_resource_group.elk_rg.name}-vnet"
  location            = azurerm_resource_group.elk_rg.location
  resource_group_name = azurerm_resource_group.elk_rg.name
  address_space       = [var.vnet_tags["address_space"]]
  # dns_servers         = var.vnet_tags["dns_servers"]

  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.elk_ddos_plan.id
    enable = false
  }

  subnet {
    name           = "${azurerm_resource_group.elk_rg.name}-subnet_public"
    address_prefix = var.subnet_public_tags["address_prefix"]
    security_group = azurerm_network_security_group.public_sg.id
  }

  subnet {
    name           = "${azurerm_resource_group.elk_rg.name}-subnet_private"
    address_prefix = var.subnet_private_tags["address_prefix"]
    security_group = azurerm_network_security_group.private_sg.id
  }

  tags = var.vnet_tags
}