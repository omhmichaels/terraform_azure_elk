provider "azurerm" {
  features {}

}



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