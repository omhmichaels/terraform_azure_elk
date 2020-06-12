
### AZ Resource Group Configuration ###
variable "rg_tags" {
  description = "Resource Group Tags"
  default = {

  }
}

variable "vnet_tags" {
  description = "Virtual Network Configuration Tags"
  default = {

  }
}

variable "subnet_private_tags" {
    description = "Private subnet tags"
    default = {

    }
}

variable "subnet_public_tags" {
    description = "Private subnet tags"
    default = {
        
    }
}