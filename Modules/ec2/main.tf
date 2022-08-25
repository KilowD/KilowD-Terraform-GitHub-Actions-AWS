

# launch the ec2 instance and install website
resource "aws_instance" "ec2_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id //we need output value from the network module
  vpc_security_group_ids = [var.aws_security_group_id] //we need output value from the security group module

  tags = {
    Name = "ec2_instance"
  }
}

