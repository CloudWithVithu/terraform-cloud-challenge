terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatestoragevithu"
    container_name       = "tfstate"
    key                  = "cloud-resume.terraform.tfstate"
  }
}