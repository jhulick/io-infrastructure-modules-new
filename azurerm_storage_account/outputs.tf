output "id" {
  value = azurerm_storage_account.storage_account.id
}

output "primary_connection_string" {
  value     = azurerm_storage_account.storage_account.primary_connection_string
  sensitive = true
}

output "primary_access_key" {
  value     = azurerm_storage_account.storage_account.primary_access_key
  sensitive = true
}

output "resource_name" {
  value = local.resource_name
}
