provider "azurerm" {
  features {}
  subscription_id                  = "7faf2fce-5f9d-4047-ab5d-148e7708fcf4"
  resource_provider_registrations  = "none"
}

resource "azurerm_resource_group" "this" {
  name     = "rg-terraform-dev"
  location = var.location
  tags     = var.tags
}

module "network" {
  source              = "../../modules/network"
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = var.tags
}

module "security" {
  source              = "../../modules/security"
  nsg_name            = var.nsg_name
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = var.tags
}

module "vm" {
  source              = "../../modules/virtual_machine"
  vm_name             = "vm-dev"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  subnet_id           = module.network.subnet_id
  nsg_id              = module.security.nsg_id
  admin_username      = var.admin_username
  tags                = var.tags
}

module "container_registry" {
  source              = "../../modules/container_registry"
  acr_name            = var.acr_name
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
  tags                = var.tags
}

module "kubernetes_cluster" {
  source              = "../../modules/kubernetes_cluster"
  cluster_name        = var.cluster_name
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
  dns_prefix          = var.dns_prefix
  node_count          = var.node_count
  vm_size             = var.vm_size
  acr_id              = module.container_registry.id
  tags                = var.tags
}

module "inventory" {
  source = "../../modules/inventory"

  vm_ip                   = module.vm.public_ip
  ssh_private_key_content = module.vm.ssh_private_key_pem
  acr_name                = module.container_registry.login_server
  acr_username            = module.container_registry.admin_username
  acr_password            = module.container_registry.admin_password
  vm_user                 = var.admin_username
}

resource "local_file" "vault_pass" {
  content         = "SuperVaultPassword123!"
  filename        = "${path.root}/../../../ansible/.vault_pass"
  file_permission = "0600"
}

resource "null_resource" "encrypt_secrets" {
  depends_on = [module.inventory]

  provisioner "local-exec" {
    command = <<EOT
      if ! grep -q "\$ANSIBLE_VAULT;" ${path.root}/../../../ansible/secrets.yml; then
        ansible-vault encrypt ${path.root}/../../../ansible/secrets.yml --vault-password-file ${path.root}/../../../ansible/.vault_pass
      else
        echo "🔒 secrets.yml ya está cifrado, no se vuelve a cifrar."
      fi
    EOT
  }

  triggers = {
    secrets_checksum = sha256(module.inventory.secrets_content)
  }
}