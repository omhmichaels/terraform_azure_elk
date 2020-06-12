
### AZ Resource Group Configuration ###
variable "rg_tags" {
  description = "Resource Group Tags"
  default = {

  }
}

variable "vnet_tags" {
  description = "Virtual Network Configuration Tags"

}

variable "subnet_private_tags" {
  description = "Private subnet tags"

}

variable "subnet_public_tags" {
  description = "Private subnet tags"

}

variable "jumpbox_nic" {
  description = "Jumpbox Nic Config Tags"
}

variable "jumpbox_tags" {
  description = "Jumpbox Configuration Tags"
}

variable "jumpbox_public_ip" {
  description = "Jumpbox Public IP"

}