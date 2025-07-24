output "kube_config" {
  value       = module.kubernetes_cluster.kube_config
  sensitive   = true
  description = "Kube config for the AKS cluster"
}

output "kube_admin_config" {
  value       = module.kubernetes_cluster.kube_admin_config
  sensitive   = true
  description = "Admin kube config for the AKS cluster"
}
