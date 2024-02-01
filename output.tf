output "test" {
       value = aws_vpc.test.id
}

output "flasksg" {
       value = aws_security_group.flasksg.id
}

output "phpsgsg" {
       value = aws_security_group.phpsg.id
}

output "test1" {
       value = aws_key_pair.test1.id
}

