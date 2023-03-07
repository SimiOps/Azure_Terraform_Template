output "resource_group_tf_name" {
  value = azurerm_resource_group.rg_tf.name
}

output "resource_group_tf_region" {
  value = azurerm_resource_group.rg_tf.location
}