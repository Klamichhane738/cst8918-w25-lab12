terraform {
  required_version = "~> 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.99.0"
    }
  }

  # Backend configuration for storing the state file
  backend "azurerm" {
    resource_group_name  = "lami0053-githubactions-rg"
    storage_account_name = "lami0053githubactions"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
    use_oidc             = true
  }
}

# Configure the Azure provider
provider "azurerm" {
  features {}

  subscription_id = "b296b604-9c48-4e98-bb66-56c661c39a1d"
}
