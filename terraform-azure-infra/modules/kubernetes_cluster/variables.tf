variable "cluster_name" {
  description = "Name of the AKS Cluster"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group for AKS"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for AKS"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in default node pool"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "Size of the VMs in the node pool"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "acr_id" {
  description = "ID of the Azure Container Registry"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}