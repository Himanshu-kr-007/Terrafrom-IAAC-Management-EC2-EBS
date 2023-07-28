# Current Status of the Instance
resource "aws_ec2_instance_state" "Current_state" {
  instance_id = aws_instance.web.id
  state       = var.defaultInstanceState
}