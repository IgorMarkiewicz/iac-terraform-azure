resource "azurerm_resource_group" "moja_resource_group1423345" {
  name     = var.nazwa_grupy
  location = var.lokacja_grupy
}

resource "azurerm_storage_account" "konto_storage" {
  name   					= var.nazwa_konta
  resource_group_name		= azurerm_resource_group.moja_resource_group1423345.name
  location					= azurerm_resource_group.moja_resource_group1423345.location
  account_tier				= var.poziom_konta
  account_replication_type	= var.typ_konta
}

resource "azurerm_storage_container" "storage_container1" {
  name 						= var.nazwa_container
  storage_account_name		= azurerm_storage_account.konto_storage.name
}

resource "azurerm_storage_blob" "storage_blob_1" {
  name 						= var.nazwa_storage_blob
  storage_account_name		= azurerm_storage_account.konto_storage.name
  storage_container_name	= azurerm_storage_container.storage_container1.name
  type						= var.typ_storage_blob
  source_content					= var.content
}
