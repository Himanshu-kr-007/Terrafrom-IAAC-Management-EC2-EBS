resource "null_resource" "Harddisk_Format" {
    
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
            "sleep 10",
	      	"sudo mkfs.ext4 /dev/xvdh",
            "sudo mount /dev/xvdh /var/www/html",
            "sudo sh -c 'echo Hello Their > /var/www/html/index.html'"

    		]
	}
    depends_on = [null_resource.webpage-Configure]

}