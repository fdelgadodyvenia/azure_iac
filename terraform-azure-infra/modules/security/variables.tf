variable "nsg_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}