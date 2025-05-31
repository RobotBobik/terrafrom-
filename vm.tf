resource "azurerm_linux_virtual_machine" "ubuntu" {
  name                  = "ubuntu-vm"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = "Standard_B1s"
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.ubuntu_nic.id]
  admin_password        = "YourPassword123!"

  os_disk {
    name                 = "ubuntu-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20_04-lts"
    version   = "latest"
  }

  tags = {
    Name = "Ubuntu"
  }

  custom_data = filebase64("ubuntu-init.sh")
}

resource "azurerm_linux_virtual_machine" "centos" {
  name                  = "centos-vm"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = "Standard_B1s"
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.centos_nic.id]
  admin_password        = "YourPassword123!"

  os_disk {
    name                 = "centos-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7_9"
    version   = "latest"
  }

  tags = {
    Name = "CentOS"
  }

  custom_data = filebase64("centos-init.sh")
}
