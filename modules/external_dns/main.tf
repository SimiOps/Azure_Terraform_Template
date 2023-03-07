resource "helm_release" "external_dns" {
  name             = var.external_dns_name
  repository       = var.external_dns_repository #"https://charts.bitnami.com/bitnami"
  chart            = var.external_dns_chart
  namespace        = var.external_dns_namespace #"kube-addons"
  create_namespace = true
  version          = var.external_dns_version #"6.13.2"
  values = [
    file("./modules/external_dns/external-dns-values.yaml") 
  ]
}