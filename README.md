
# Terraform Configuration for Infrastructure Management
This repository contains Terraform code for managing infrastructure resources with a focus on dividing the code for specific purposes and utilizing various Terraform features. Below are the key points explained in this README.md file:

## 1. Divide the Terraform Code for Specific Purpose
The Terraform code is organized into separate resource blocks and provisioners, each serving a specific purpose. We have modularized the code to enhance readability, maintainability, and reusability.

## 2. Datatype: Map
In the Terraform variables section, we have utilized the map datatype to allow dynamic instance type selection based on the environment. The map includes different instance types for Dev, Test, and Prod environments.

## 3. Keyword include
We have leveraged the include keyword to load variables from external .tfvars files. This approach allows us to manage environment-specific variables separately, improving flexibility and avoiding hardcoding.

## 4. Keyword lookup
The lookup function is used to fetch the appropriate instance type from the map based on the Terraform workspace. This dynamic lookup ensures that the instance type is chosen according to the specific environment.

## 5. Force Detach for Volume
For the AWS EBS volume attachment, the force_detach parameter is utilized to ensure that the volume is detached from the instance even if it is still in use. This is helpful when the volume is attached during provisioning and must be detached during destruction.

## 6. Trigger current = timestamp()
We employ the triggers block with the current = timestamp() to force the execution of specific provisioners or actions during Terraform runs. In this case, we ensure that certain actions, such as generating an Ansible inventory, occur every time the Terraform configuration is applied.

## 7. Set Up Ansible Inventory with Terraform Local-exec
Through a null_resource and the local-exec provisioner, we create an Ansible inventory file dynamically. This approach allows seamless integration of Ansible with Terraform, enabling smooth configuration management.

## 8. Use of Depends On
We use the depends_on attribute to manage resource dependencies. For instance, ensuring that certain resources, like the EC2 instance, are created before others, such as the EBS volume and volume attachment, are executed.

## 9. Use of when = destroy Keyword
With the provisioner local-exec, we set the when attribute to "destroy." This ensures that the specified local command is executed only during the destruction phase (terraform destroy), making it suitable for cleanup tasks or additional actions during environment teardown.

Feel free to explore the Terraform code in this repository and adapt it for your infrastructure management needs. Happy Terraforming! 🚀🌐
