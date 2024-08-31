terraform {
  backend "azurerm" {
    resource_group_name   = "my-terraform-backend-rg"   # Resource group containing the storage account
    storage_account_name  = "myterraformstorageacct"    # Storage account for storing the Terraform state
    container_name        = "tfstate"                   # Blob container for the state file
    key                   = "terraform.tfstate"         # Path and name of the state file within the container
  }
}
