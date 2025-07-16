variable "vnet_name" {}
variable "subnet_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "address_space" {
  default = ["10.0.0.0/16"]
}
variable "subnet_prefixes" {
  default = ["10.0.1.0/24"]
}
variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}