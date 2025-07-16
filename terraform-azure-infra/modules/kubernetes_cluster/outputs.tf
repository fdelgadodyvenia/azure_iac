output "kube_config" {
  description = "Kube config for the AKS cluster"
  value       = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive   = true
}

output "kube_admin_config" {
  description = "Kube admin config for the AKS cluster"
  value       = azurerm_kubernetes_cluster.this.kube_admin_config_raw
  sensitive   = true
}
