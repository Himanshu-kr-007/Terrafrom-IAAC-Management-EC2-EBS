resource "null_resource" "Ansible_Inventory" {
    triggers = {
        CurrentTime = timestamp()
    }
	# Printing the IP Address in the Inventory
	provisioner "local-exec" {
	    command =  "echo ${aws_instance.web.public_ip} > inventory"
	}
    # If AWS EC2 Launch then Run this File
    depends_on = [aws_instance.web]
}