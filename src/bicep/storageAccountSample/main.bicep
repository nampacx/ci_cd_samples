param deploymentName string
param location string = 'westeurope'

var resourceGroupName = 'rg-${deploymentName}'
var storageAccountName = '${deploymentName}sa'

targetScope = 'subscription'

resource rG 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location

}

module sa 'stroageAccount.bicep' = { 
  scope: resourceGroup(resourceGroupName)
  name: storageAccountName
   params:{
    storageAccountSku: 'Standard_LRS'
    location: rG.location
    storageAccountName: storageAccountName
  }  
}
