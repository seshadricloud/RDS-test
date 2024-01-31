variable "region" {}

variable "cidr_block" {
description = ""
type = string
default = ""
}


variable "envname" {}
variable "pubsubnets" {}
variable "privsubnets" {}
variable "datasubnets" {}  # Add this line to declare the variable
variable "azs" {}
variable "ami" {}
variable "type" {}



# variable "cidr_blocks" {
# description = ""
# type = list(string)
# default = []
# }