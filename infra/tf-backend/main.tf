provider "azurerm" {
  features {}
  subscription_id = "b296b604-9c48-4e98-bb66-56c661c39a1d"
}

# Resource group definition
resource "azurerm_resource_group" "rg" {
  name     = "lami0053-githubactions-rg"
  location = "East US" # You can change the location to your preferred region
}

# Storage account definition
resource "azurerm_storage_account" "sa" {
  name                     = "lami0053githubactions"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

# Storage container definition
resource "azurerm_storage_container" "container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "lami0053-githubactions-rg"
    storage_account_name = "lami0053githubactions"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
# Output the resource group name
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

# Output the storage account name
output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

# Output the container name
output "container_name" {
  value = azurerm_storage_container.container.name
}

# Output the primary access key of the storage account
output "storage_account_primary_access_key" {
  value     = azurerm_storage_account.sa.primary_access_key
  sensitive = true
}