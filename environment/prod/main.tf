module "vnet" {
  source              = "../../modules/azurerm_V-Net"
  vnet_name           = "v-nett"
  location            = "centralindia"
  resource_group_name = "rg-intel-core"
  address_space       = ["10.0.0.0/16"]
}

module "subnet" {
  depends_on           = [module.vnet]
  source               = "../../modules/azurerm_Subnet"
  subnet_name          = "backend-subnet"
  resource_group_name  = "rg-intel-core"
  virtual_network_name = "v-nett"
  address_prefixes     = ["10.0.1.0/24"]
}
