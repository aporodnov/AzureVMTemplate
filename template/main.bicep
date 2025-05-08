targetScope = 'subscription'

param location string
param ResourceGroupName string
param Tags object

module resourceGroupModule 'br/public:avm/res/resources/resource-group:0.4.1' = {
  scope: subscription()
  name: 'DeployResourceGroup'
  params: {
    name: ResourceGroupName
    location: location
    tags: Tags
  }
}
param virtualMachines array

param adminUsername string
@secure()
param adminPassword string

module VM 'br/public:avm/res/compute/virtual-machine:0.15.0' = [ for vm in virtualMachines: {
  name: 'DeployVirtualMachine-${vm.name}'
  scope: resourceGroup(ResourceGroupName)
  params: {
    name: vm.name
    osType: vm.osType
    vmSize: vm.Size
    zone: vm.Zone
    adminUsername: vm.adminUsername
    adminPassword: vm.adminPassword
    imageReference: vm.Image
    nicConfigurations: vm.NICconfigs
    osDisk: vm.osDisk
    dataDisks: vm.DataDisks
  }
}]

