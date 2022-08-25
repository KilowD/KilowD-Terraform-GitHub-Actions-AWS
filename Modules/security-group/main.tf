# create security group for the ec2 instance
resource "aws_security_group" "dev_security_group" {
  name        = "dev security group"
  description = "dev security group"
  vpc_id      = var.vpc-id  //we need an output value from the Network Module

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }


  tags   = {
    Name ="dev security group"
  }
}
