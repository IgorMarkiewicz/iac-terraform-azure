resource "azurerm_resource_group" "moja_resource_group" {
  name     = var.nazwa_grupy
  location = var.lokacja_grupy
}

resource "azurerm_storage_account" "konto_storage" {
  name	   						= var.nazwa_konta
  resource_group_name			= azurerm_resource_group.moja_resource_group.name
  location						= azurerm_resource_group.moja_resource_group.location
  account_tier					= var.poziom_konta
  account_replication_type		= var.typ_konta
}

resource "azurerm_app_service_plan" "service_plan" {
  name 							= var.nazwa_service_plan
  location						= azurerm_resource_group.moja_resource_group.location
  resource_group_name			= azurerm_resource_group.moja_resource_group.name
  
  sku {
	tier = var.poziom_konta
	size = var.rozmiar_service_plan
  }
}

resource "azurerm_linux_function_app" "funkcja_linux" {
  name 							= var.nazwa_aplikacji_linux
  resource_group_name			= azurerm_resource_group.moja_resource_group.name
  location						= azurerm_resource_group.moja_resource_group.location
  storage_account_name			= azurerm_storage_account.konto_storage.name
  service_plan_id  				= azurerm_app_service_plan.service_plan.id
  
  site_config {}
}

resource "azurerm_function_app_function" "funkcja_aplikacji" {
  name							= var.nazwa_funkcji_aplikacji
  function_app_id 				= azurerm_linux_function_app.funkcja_linux.id
  test_data 					= jsonencode({
	"name" = var.nazwa_testu
  })
  config_json = jsonencode(var.kod_json)
}
