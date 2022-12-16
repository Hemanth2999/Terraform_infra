variable "aws_access_key" {}
variable "aws_secrete_key" {}
variable "aws_region" {}
variable "amis" {
    description = "AMIs by region"
    default = {
        us-east-1a = "ami-0b0dcb5067f052a63" # ubuntu 14.04 LTS
    }
}
variable "vpc_name" {}
variable "aws_cider_block" {}
variable "aws_igw_name" {}
variable "aws_public_subnet1_name" {}
variable "aws_public_subnet1_cidr" {}
variable "aws_public_subnet2_name" {}
variable "aws_public_subnet2_cidr" {}
variable "aws_route_table" {}
variable "aws_security_group" {}
variable "aws_key_name" {}
variable "azs" {
  description = "Run the EC2 Instances in these Availability Zones"
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "environment" { default = "dev" }
variable "instance_type" {
  default = {
    dev = "t2.micro"
     }
}
