resource "null_resource" "webpage-Configure" {
    # Force Replacement - Every Time
    # We can use timestamp(). Everytime we run the manifest file it will run on new time.
    triggers = {
        CurrentTime = timestamp()      
    }
	# Login Inside the OS by ssh using Username and Private Key
	connection {
	      user        = "ec2-user"
	      type        = "ssh"
	      private_key = file("C:/Users/Himanshu Kumar/Documents/Terraform/Day 1/HimanshuTF.pem")
	      host 	  = aws_instance.web.public_ip
	}

	# Downloading the Software Inside the OS
	provisioner "remote-exec" {
	    inline = [
	      	"sudo yum -y install httpd",
		    "sudo systemctl enable httpd --now"
    		]
	}
}