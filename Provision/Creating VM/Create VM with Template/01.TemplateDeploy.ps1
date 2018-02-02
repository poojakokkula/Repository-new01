#creating New ResourceGroup 
New-AzureRmResourceGroup -Name temreso -Location eastus
#Testing if template is valid or not
Test-AzureRmResourceGroupDeployment -ResourceGroupName temreso -Mode Complete -TemplateFile "C:\Users\poojako\Desktop\vmtemplate2.json"
#Creating VM
New-AzureRmResourceGroupDeployment -Name demoResr -ResourceGroupName temreso -Mode Complete -DeploymentDebugLogLevel All -TemplateFile "C:\Users\poojako\Desktop\vmtemplate2.json"