resource "azurerm_resource_group" "rg_tf" {
 name   = var.rg_name
 location = var.rg_region
}
