provider "helm" {
  kubernetes {
    host                   = var.kubeconfig_tf.0.host
    client_certificate     = base64decode(var.kubeconfig_tf.0.client_certificate)
    client_key             = base64decode(var.kubeconfig_tf.0.client_key)
    cluster_ca_certificate = base64decode(var.kubeconfig_tf.0.cluster_ca_certificate)
  }
}
