

resource "azurerm_network_security_group" "ssh_sg" {
  name                = "${azurerm_resource_group.elk.name}-ssh_sg"
  location            = azurerm_resource_group.elk.location
  resource_group_name = azurerm_resource_group.elk.name

  security_rule {
    name                       = "ssh-inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "22"
    source_address_prefix      = "47.148.134.65"
    destination_address_prefix = "47.148.134.65"
  }


  security_rule {
    name                       = "ssh-outbound"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "47.148.134.65"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_security_group" "http_sg" {
  name                = "${azurerm_resource_group.elk.name}-http_sg"
  location            = azurerm_resource_group.elk.location
  resource_group_name = azurerm_resource_group.elk.name

  security_rule {
    name                       = "http-inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "80"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }


  security_rule {
    name                       = "http-outbound"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "80"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }


  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_security_group" "https_sg" {
  name                = "${azurerm_resource_group.elk.name}-https_sg"
  location            = azurerm_resource_group.elk.location
  resource_group_name = azurerm_resource_group.elk.name

  security_rule {
    name                       = "https-inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "443"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }


  security_rule {
    name                       = "https-outbound"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "443"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_security_group" "public_sg" {
  name                = "${azurerm_resource_group.elk.name}-https_sg"
  location            = azurerm_resource_group.elk.location
  resource_group_name = azurerm_resource_group.elk.name

  security_rule {
    name                       = "ssh-inbound"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "22"
    source_address_prefix      = "47.148.134.65"
    destination_address_prefix = "47.148.134.65"
  }


  security_rule {
    name                       = "ssh-outbound"
    priority                   = 102
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "47.148.134.65"
  }

  security_rule {
    name                       = "http-inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "80"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }


  security_rule {
    name                       = "http-outbound"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "80"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "https-inbound"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "443"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }


  security_rule {
    name                       = "https-outbound"
    priority                   = 101
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "443"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}


resource "azurerm_network_security_group" "private_sg" {
  name                = "${azurerm_resource_group.elk.name}-https_sg"
  location            = azurerm_resource_group.elk.location
  resource_group_name = azurerm_resource_group.elk.name

  security_rule {
    name                       = "ssh-inbound"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.0.0"
    destination_address_prefix = "10.0.0.0"
  }


  security_rule {
    name                       = "ssh-outbound"
    priority                   = 101
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.0.0"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "http-inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "80"
    destination_port_range     = "80"
    source_address_prefix      = "10.0.0.0"
    destination_address_prefix = "*"
  }


  security_rule {
    name                       = "http-outbound"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "80"
    destination_port_range     = "80"
    source_address_prefix      = "10.0.0.0"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "https-inbound"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "443"
    destination_port_range     = "443"
    source_address_prefix      = "10.0.0.0"
    destination_address_prefix = "*"
  }


  security_rule {
    name                       = "https-outbound"
    priority                   = 102
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "443"
    destination_port_range     = "443"
    source_address_prefix      = "10.0.0.0"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}