# terraform.tf

# Define the Terraform block
terraform {
  backend "azurerm" {
    resource_group_name  = "lami0053-githubactions-rg"
    storage_account_name = "lami0053githubactions" # Same as the backend created
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
    use_oidc             = true  # Enable OIDC for backend authentication
  }
}

provider "azurerm" {
  features {}
  use_oidc = true  # Enable OIDC for Azure provider authentication
}