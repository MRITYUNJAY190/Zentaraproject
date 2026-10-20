terraform {
  required_version = ">= 1.9.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.6.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stterraformstate01012"
    container_name       = "tfstate"
    key                  = "zentara-dev.tfstate"
  }
}

provider "azurerm" {
  features {}
}