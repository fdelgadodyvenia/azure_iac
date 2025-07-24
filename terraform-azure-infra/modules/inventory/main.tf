resource "local_file" "private_key_file" {
  content         = var.ssh_private_key_content
  filename        = "${path.root}/../../../ansible/private_key.pem"
  file_permission = "0600"
}

resource "local_file" "secrets_file" {
  content = templatefile("${path.module}/secrets.tmpl", {
    acr_name        = var.acr_name
    acr_username    = var.acr_username
    acr_password    = var.acr_password
    vm_user         = var.vm_user
    ssh_private_key = local_file.private_key_file.filename
  })

  filename        = "${path.root}/../../../ansible/secrets.yml"
  file_permission = "0600"
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tmpl", {
    vm_ip           = var.vm_ip
    ssh_private_key = local_file.private_key_file.filename
    acr_name        = var.acr_name
    acr_username    = var.acr_username
    acr_password    = var.acr_password
    vm_user         = var.vm_user              # 👈 añade esto
  })

  filename        = "${path.root}/../../../ansible/inventory.ini"
  file_permission = "0644"
}
