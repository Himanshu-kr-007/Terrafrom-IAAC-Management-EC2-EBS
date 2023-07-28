# Security Group
variable "mySecurityGroup" {}

# Default Region
variable "defaultRegion" {}

# AMI ID 
variable "amiId" {}

# Default Key	
variable "defaultKey" {}

# Default Instance Type 
variable "defaultInstanceType" {
	type = map
	default = {
		dev = "t2.micro"
		test ="t2.small" 
		prod = "t2.large"
	}
} 

# Default Instance State
variable "defaultInstanceState" {}
