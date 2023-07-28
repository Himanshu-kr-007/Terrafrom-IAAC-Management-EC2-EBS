# Launching AWS Instance
resource "aws_instance" "web" {
	  ami           = var.amiId
	  key_name 	    = var.defaultKey
	  # instance_type = var.defaultInstanceType

    # Retrive the Instance Type from Dev Variale
	  # instance_type = var.defaultInstanceType["dev"]
	  
    # Retrive the Instance Type from Default Workspace
    instance_type = lookup(var.defaultInstanceType, terraform.workspace)
	  vpc_security_group_ids  = [var.mySecurityGroup]
    tags = {
      Name = "OS By TF"
    }
}

# Creating 1 Storage Device of 1 GB in Size in Region ap-south-1 with name Webserver Volume
resource "aws_ebs_volume" "MyVolume"{
  availability_zone = aws_instance.web.availability_zone
  size              = 1
  tags = {
    Name = "WebServer Volume"
  }
# If AWS EC2 is created then Create new Harddisk
  depends_on = [ aws_instance.web ]
}

# Attaching the Harddisk to the OS 
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.MyVolume.id
  instance_id = aws_instance.web.id
  force_detach = true
  
# Meta arguments & meta resources
# Depend on when EBS Volume is attached
  depends_on = [aws_ebs_volume.MyVolume]
}
