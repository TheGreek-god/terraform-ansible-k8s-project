resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                = "terraform-cluster"
  location            = data.azurerm_resource_group.greekrg.location
  resource_group_name = data.azurerm_resource_group.greekrg.name

  dns_prefix          = "${data.azurerm_resource_group.greekrg.name}-dns"

  default_node_pool {
    name       = "default"
    node_count = 1 # Disable default node pool by setting 0 nodes
    vm_size    = "Standard_D2_v2"
  }

identity {
    type = "SystemAssigned"
  }

}

resource "azurerm_kubernetes_cluster_node_pool" "nodepool" {
  name                  = "internal"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks-cluster.id
  vm_size               = "Standard_D2_v2" 
  node_count            = 1  # min node count (initial)
  tags = {
    Environment = "Development"
  }
}

