variable "vm_ip" {
  description = "Public IP address of the VM"
  type        = string
}

variable "ssh_private_key_content" {
  description = "Content of the SSH private key"
  type        = string
  sensitive   = true
}

variable "acr_name" {
  description = "Azure Container Registry login server"
  type        = string
}

variable "acr_username" {
  description = "Azure Container Registry admin username"
  type        = string
}

variable "acr_password" {
  description = "Azure Container Registry admin password"
  type        = string
  sensitive   = true
}

variable "vm_user" {
  description = "Username for the VM"
  type        = string
}