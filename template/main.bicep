targetScope = 'subscription'

param location string = 'canadacentral'

param ResourceGroupName string
param Tags object

// param vmArray array

module resourceGroupModule 'br/public:avm/res/resources/resource-group:0.4.1' = {
  scope: subscription()
  name: 'DeployResourceGroup'
  params: {
    name: ResourceGroupName
    location: location
    tags: Tags
  }
}
