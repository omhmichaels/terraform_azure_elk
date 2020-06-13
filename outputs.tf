
output "identity" {
  value      = "${azurerm_linux_virtual_machine.jumpbox.identity}"
  depends_on = [azurerm_linux_virtual_machine.jumpbox]
}

output "private_ip_address" {
  value      = "${azurerm_linux_virtual_machine.jumpbox.private_ip_address}"
  depends_on = [azurerm_linux_virtual_machine.jumpbox]
}

output "public_ip_address" {
  value      = "${azurerm_linux_virtual_machine.jumpbox.public_ip_address}"
  depends_on = [azurerm_linux_virtual_machine.jumpbox]
}

output "admin_username" {
  value      = "${azurerm_linux_virtual_machine.jumpbox.admin_username}"
  depends_on = [azurerm_linux_virtual_machine.jumpbox]
}