#test.tfvars

region      = "us-east-1"
cidr        = "10.1.0.0/16"
envname     = "tera-dev"
pubsubnets  = ["10.1.0.0/24", "10.1.1.0/24", "10.1.2.0/24"]
privsubnets = ["10.1.3.0/24", "10.1.4.0/24", "10.1.5.0/24"]
# datasubnets  = ["10.3.7.0/24", "10.3.8.0/24", "10.3.9.0/24"]
azs         = ["us-east-1a", "us-east-1c", "us-east-1d"]
ami         = "ami-0a3c3a20c09d6f377"
type        = "t2.micro"

