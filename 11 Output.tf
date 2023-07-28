output "InstanceTypeDEV" {
	  value = var.defaultInstanceType["dev"]
}

output "InstanceTypeTEST" {
	  value = var.defaultInstanceType["test"]
}

output "InstanceTypePROD" {
	  value = var.defaultInstanceType["prod"]
}

# Viewing the Instance Type By using Lookup
output "InstanceTypeDEVLookup" {
	  value = lookup( var.defaultInstanceType, "dev")
}

output "InstanceTypeTESTLookup" {
	  value = lookup( var.defaultInstanceType, "test")
}

# View the Current Workspace
output "CurrentWorkspace" {
      value = terraform.workspace
}

output "ListALLWorkSpaceCommand" {
      value = "terraform workspace list"
}

output "CreateNewWorkSpaceCommand" {
      value = "terraform workspace new test"
}

output "SelectWorkSpaceCommand" {
      value = "terraform workspace select default"
}

# Viewing the Instance Type By looking into workspace using Lookup  
# If we are in the dev Workspace then we can see the t2.small instance
output "InstanceTypeDEVLookup" {
	  value = lookup( var.defaultInstanceType, terraform.workspace)
}

# If we are in the Test Workspace then we can see the t2.medium instance
output "InstanceTypeTESTLookup" {
	  value = lookup( var.defaultInstanceType, terraform.workspace)
}
