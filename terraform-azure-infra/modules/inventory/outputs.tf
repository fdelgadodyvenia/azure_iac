output "secrets_content" {
  description = "Content of the secrets.yml file"
  value       = local_file.secrets_file.content
  sensitive   = true
}