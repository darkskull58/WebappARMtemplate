terraform {
  backend "azurerm" {}
}


provider "azurerm" {
   
    features {}
  # Configuration options
}
resource "random_uuid" "test" {
}

resource "azurerm_resource_group" "example" {
  name     = "demo"
  location = "Central India"
}

resource "azurerm_storage_account" "example" {
  name                     = "yashstorageaccount-${random_uuid.test.result}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  depends_on = [
    azurerm_resource_group.example
  ]

  tags = {
    environment = "staging"
  }
}
