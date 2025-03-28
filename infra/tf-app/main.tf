# Reference the outputs from tf-backend using terraform_remote_state
data "terraform_remote_state" "backend" {
  backend = "azurerm"
  config = {
    resource_group_name  = "lami0053-githubactions-rg"
    storage_account_name = "lami0053githubactions"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

# Create a Resource Group for testing in tf-app
resource "azurerm_resource_group" "app_rg" {
  name     = "lami0053-a12-rg"
  location = "East US"
}

# Declare the storage account in tf-app (if necessary)
resource "azurerm_storage_account" "app_storage" {
  name                     = "lami0053appstorage"
  resource_group_name       = azurerm_resource_group.app_rg.name
  location                 = azurerm_resource_group.app_rg.location
  account_tier               = "Standard"
  account_replication_type = "LRS"
  min_tls_version           = "TLS1_2"
}

# Declare the storage container in tf-app (if necessary)
resource "azurerm_storage_container" "app_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.app_storage.name
  container_access_type = "private"
}

# Output the details from tf-backend (the storage account from the backend)
output "backend_storage_account_name" {
  value = data.terraform_remote_state.backend.outputs.storage_account_name
}

output "backend_container_name" {
  value = data.terraform_remote_state.backend.outputs.container_name
}
