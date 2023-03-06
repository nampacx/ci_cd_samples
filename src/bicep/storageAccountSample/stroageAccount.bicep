param storageAccountSku string = 'Standard_LRS'
param storageAccountName string
param location string 

targetScope = 'resourceGroup'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountSku
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
  dependsOn: [
  ]
}
