#rds.tf



#security group
resource "aws_security_group" "rds" {
  name        = "rds"
  description = "Allow 8080 and ssh inbound traffic"
  vpc_id      = aws_vpc.test.id

  ingress {
    description      = "ssh from VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups       = ["${aws_security_group.flasksg.id}"]

  }
 ingress {
    description      = "http from VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups       = ["${aws_security_group.phpsg.id}"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.envname}-rdssg"
  }
}

resource "aws_db_subnet_group" "db-subnetgroup" {
  name       = "db-subnetgroup"
  subnet_ids = [ aws_subnet.pubsubnets[1].id, aws_subnet.pubsubnets[2].id]

  tags = {
    Name = "${var.envname}-rdssubnet-group"
  }
}


resource "aws_db_instance" "mysql" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "new"
  username             = "krishna"
  password             = "9573972811Mahi"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name   = aws_db_subnet_group.db-subnetgroup.name
  vpc_security_group_ids = ["${aws_security_group.rds.id}"]

}