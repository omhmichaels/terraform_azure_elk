### Azure Public Subnet
/*
resource "azurerm_public_ip" "ng_public_ip" {
  name                = "${azurerm_resource_group.elk.name}-ng_public_ip"
  location            = azurerm_resource_group.elk.location
  resource_group_name = azurerm_resource_group.elk.name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1"]
}

resource "azurerm_public_ip_prefix" "ng_ip_prefix" {
  name                = "${azurerm_resource_group.elk.name}-ng_ip_prefix"
  location            = azurerm_resource_group.elk.location
  resource_group_name = azurerm_resource_group.elk.name
  prefix_length       = 30
  zones               = ["1"]
}

resource "azurerm_nat_gateway" "public_ng" {
  name                = "${azurerm_resource_group.elk.name}-public_ng"
  location            = azurerm_resource_group.elk.location
  resource_group_name = azurerm_resource_group.elk.name
  public_ip_address_ids   = [azurerm_public_ip.ng_public_ip.id]
  public_ip_prefix_ids    = [azurerm_public_ip_prefix.ng_ip_prefix.id]
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  zones                   = ["1"]
}

resource "azurerm_nat_gateway_public_ip_association" "ng_public_ip_association" {
  nat_gateway_id       = azurerm_nat_gateway.public_ng.id
  public_ip_address_id = azurerm_public_ip.ng_public_ip.id
}
*/

resource "azurerm_subnet" "subnet_public" {
  name                 = "${azurerm_resource_group.elk.name}-subnet_public"
  resource_group_name  = azurerm_resource_group.elk.name
  virtual_network_name = azurerm_virtual_network.elk_vnet.name
  address_prefixes     = [var.subnet_public_tags["address_prefixes"]]

}


resource "azurerm_subnet" "subnet_private" {
  name                 = "${azurerm_resource_group.elk.name}-subnet_private"
  resource_group_name  = azurerm_resource_group.elk.name
  virtual_network_name = azurerm_virtual_network.elk_vnet.name
  address_prefixes     = [var.subnet_private_tags["address_prefixes"]]

}

