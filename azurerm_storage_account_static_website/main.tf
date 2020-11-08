terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "azurerm" {}
}

resource "azurerm_storage_account" "storage_account" {
  name                      = local.resource_name
  resource_group_name       = var.resource_group_name
  location                  = var.region
  account_kind              = var.account_kind
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  access_tier               = var.access_tier
  enable_https_traffic_only = true

  static_website {
    index_document     = var.index_document
    error_404_document = var.error_404_document
  }

  tags = {
    environment = var.environment
  }
}

# Enable advanced threat protection
resource "azurerm_advanced_threat_protection" "advanced_threat_protection" {
  target_resource_id = azurerm_storage_account.storage_account.id
  enabled            = true
}

module "storage_account_versioning" {
  source               = "git::git@github.com:pagopa/io-infrastructure-modules-new.git//azurerm_storage_account_versioning?ref=v2.1.9"
  name                 = format("%s-versioning", local.resource_name)
  resource_group_name  = var.resource_group_name
  storage_account_name = local.resource_name
  enable               = var.enable_versioning
}
