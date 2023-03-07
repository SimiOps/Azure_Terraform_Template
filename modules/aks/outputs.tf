output "cluster_tf_id" {
  value = azurerm_kubernetes_cluster.aks-tf.id
}

output "public_ip_aks" {
  value = azurerm_public_ip.ip-aks-tf.ip_address
}

output "kubeconfig_tf" {
  value = azurerm_kubernetes_cluster.aks-tf.kube_config
}

output "kubeconfig_raw_tf" {
  value = azurerm_kubernetes_cluster.aks-tf.kube_config_raw
}

output "aks_apiserver" {
  value = azurerm_kubernetes_cluster.aks-tf.fqdn
}

