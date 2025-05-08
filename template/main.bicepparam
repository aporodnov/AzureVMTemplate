using 'main.bicep'

param ResourceGroupName = 'Application01'

param location = 'canadacentral'

param Tags = {
  Environment: 'Production'
  Department: 'IT'
  Project: 'AzureMigration'
}

