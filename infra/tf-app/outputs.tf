output "storage_account_name" {
  value       = azurerm_storage_account.app_storage.name
  description = "The name of the storage account."
}

output "container_name" {
  value       = azurerm_storage_container.app_container.name
  description = "The name of the storage container."
}

output "arm_access_key" {
  value       = azurerm_storage_account.app_storage.primary_access_key
  description = "The access key for the storage account."
  sensitive   = true
}

output "resource_group_name" {
  value       = azurerm_resource_group.app_rg.name
  description = "The resource group name."
}

output "storage_account_id" {
  value       = azurerm_storage_account.app_storage.id
  description = "The ID of the storage account."
}
