variable "vm_name" {}
variable "vm_size" {
  default = "Standard_B1s"
}
variable "location" {}
variable "resource_group_name" {}
variable "subnet_id" {}
variable "nsg_id" {}
variable "admin_username" {
  default = "azureuser"
}
variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}