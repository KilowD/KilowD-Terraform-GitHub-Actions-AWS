
module "myVpc" {
  source             = "../Modules/Network"
  base_name          =  var.base_name
  vpc-cidr           =  var.vpc-cidr
  public-subnet-cidr =  var.public-subnet-cidr
}

 module "securityGrp" {
  source     = "../Modules/security-group"
  depends_on = [module.myVpc.id]
  vpc-id     = module.myVpc.vpc-id
}


module "ec2" {
  source                 = "../Modules/ec2"
  depends_on             = [module.myVpc.id, module.securityGrp.id] // ec2 module depends on values from other modules
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = module.myVpc.subnet_id           //we need an output value from the network module..no need to reference a variable here
  aws_security_group_id  = module.securityGrp.aws_security_group_id //we need an output value from the security group module
}


//Use variable names that match exactly the variables expected in the main modules e.g ami in the Module block must be the same as
//the ami in the ec2 block defefination 