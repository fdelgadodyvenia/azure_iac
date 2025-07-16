variable "location" {
  default = "westeurope"
}
variable "admin_username" {
  default = "azureuser"
}
variable nsg_name {}
variable subnet_name {}
variable vnet_name {}
variable acr_name {}

variable node_count {}
variable dns_prefix {}
variable cluster_name {}
variable vm_size {}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}