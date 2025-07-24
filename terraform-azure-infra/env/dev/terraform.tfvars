location = "westeurope"
admin_username = "azureuser"
vnet_name = "vnet-dev"
subnet_name = "subnet-dev"
nsg_name = "nsg-dev"

#Container Registry
acr_name = "acrterraformdev148e7708fcf4" #unique in azure ad subs_id

#AKS
node_count = 1
dns_prefix = "aksdev"
cluster_name = "aks-casopractico2-dev"
vm_size = "Standard_B2s"
##

tags = {
    environment = "casopractico2"
  }