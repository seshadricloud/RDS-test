#php.tf


#security groups
resource "aws_security_group" "phpsg" {
  name        = "php1"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.test

  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  ingress {
    description      = "ssh from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.envname}-phpsg"
  }
}

# #keypair
# resource "aws_key_pair" "seshadritest" {
#   key_name   = "seshadritest1"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOCUWw7UNEtW8QRHTKFp7xFbCR+Fo6ESVsqwwszQocidCyb8mJkBrs+PvqEbhRAmmqRc5Xoj1EwDcXCGYXclu5MbEzIli6x3U/413qFKB6DYsu+b/MHQ8EA920jdsXoqhD/4VSo2QC96AXeUeJKlW8+i93sRum51Gzjt7xHI/LjitOV2bi1WBWESfTzljLBggVxz/oEu0P+447159QyHbleNYlq0o7fL7SpPn6FkhRg/wDrNMkPBr4sjmv9BYjpWtLo9+xbkAOunssnCIAIDxSTZk7ykTVLaff2ENyGd+rpc5QQKMnJVxlbbJLogBcWZM+iqwswvVtUcoY9vOoGm4yuB9S2po7/TcxYb15DOJyllMeIv5vqZXtm7qMFByERoquWmiaVS9ponGmV+keYwF9Rj1ZyxJjt3/gACKhHNlLGa1zvy9RHOX/H9CZyzPSvpdRZ/NoiwdsKz0gCmx09No1SbGWzpj7BdtT/wwlBtbB6VHoLXXx7hVLd4gSGuHZ49zFMdSO/Pk0loQGxYWip0snilxETJY5UyHlv+vlBQ7lIbHaxT50irdGpfFKfpy5/YjIU1LBqVLjco36cX+N41U5jHrcUwdmw70CcIPJ446Vz/12EVOtxmUvmn/iA7G6tbxy2efGrwsqsOxIM/juxXRqv3KCnQudSHdGUdyYivMfiw== seshadrireddybhavanasi@gmail.com"
# }


#instace
resource "aws_instance" "php" {
  ami           = var.ami
  instance_type = var.type
  key_name = aws_key_pair.seshadritest1.id
  vpc_security_group_ids = ["${aws_security_group.phpsg.id}"]
  subnet_id = "${aws_subnet.pubsubnets[0].id}"
  user_data = data.template_file.userdata1.rendered

  tags = {
    Name = "${var.envname}-tera-dev"
  }
}


#userdata
data "template_file" "userdata1" {
  template = "${file("php.sh")}"

}