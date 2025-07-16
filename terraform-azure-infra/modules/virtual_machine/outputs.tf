output "public_ip" {
  value = azurerm_public_ip.this.ip_address
}

output "ssh_private_key_pem" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}
