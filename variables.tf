
variable "aws_access_key" {}
variable "aws_secrete_key" {}
variable "aws_region" {}
variable "amis" {
    description = "AMIs by region"
    default =  "ami-0574da719dca65348" # ubuntu 14.04 LTS
    }
variable "vpc_name" {}
variable "aws_cidr_block" {}
variable "aws_igw_name" {}
variable "aws_public_subnet1_name" {}
variable "aws_public_subnet1_cidr" {}
variable "aws_public_subnet2_name" {}
variable "aws_public_subnet2_cidr" {}
variable "aws_route_table" {}
variable "aws_security_group" {}
variable "key_name" {}
variable "azs" {}
variable "environment" { default = "dev" }
variable "instance_type" {
  default = {
    dev = "t2.micro"
     }
}