provider "azurerm" {
  features {}

}



resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}


resource "azurerm_network_ddos_protection_plan" "ddos_plan" {
  name                = "${var.resource_group_name}-ddos_plan"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
}
