output "storage_account_name" {
  value = azurerm_storage_account.app_storage.name
}

output "container_name" {
  value = azurerm_storage_container.app_container.name
}

output "arm_access_key" {
  value     = azurerm_storage_account.app_storage.primary_access_key
  sensitive = true
}