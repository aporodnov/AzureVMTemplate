using 'main.bicep'

param ResourceGroupName = 'Application01'
param location = 'canadacentral'
param Tags = {
  Environment: 'Production'
  Department: 'IT'
  Project: 'AzureMigration'
}

// Keep them all empty, the actual values are passed via GitHub environment secrets
@secure()
param adminUsername = ''
@secure()
param adminPassword = ''


param virtualMachines = [
  {
    name: 'VM01'
    osType: 'Windows'
    Size: 'Standard_DS1_v2'
    Zone: 1
    adminUsername: adminUsername
    adminPassword: adminPassword
    Image: {
      publisher: 'MicrosoftWindowsServer'
      offer: 'WindowsServer'
      sku: '2019-Datacenter'
      version: 'latest'
    }
    NICconfigs: [
      {
        name: 'VM01-NIC01'
        deleteOption: 'Delete'
        // networkSecurityGroupResourceId: 'FIXME'
        ipConfiguration: [
          { 
            name: 'ifconfig01'
            subnetId: '/subscriptions/e97e7eb7-daad-44e7-823c-9862b6b6eb92/resourceGroups/ProdVNET-RG/providers/Microsoft.Network/virtualNetworks/org1prod-vnet/subnets/Servers'
            privateIPAllocationMethod: 'Dynamic'
          }
        ]
      }
    ]
    osDisk: {
      name: 'VM01-OSDisk'
      createOption: 'FromImage'
      deleteOption: 'Delete'
      diskSizeGB: 128
      managedDisk: {
        storageAccountType: 'Standard_LRS'
      }
    }
    DataDisks: [
      {
        name: 'VM01-DataDisk01'
        diskSizeGB: 128
        createOption: 'Attach'
        deleteOption: 'Detach'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
        }
      }
    ]
  }
]
