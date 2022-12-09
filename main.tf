provider "aws" {
    access_key = "AKIA2KQBDCDGJ47EVDOK"
    secret_key = "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"
    region = "us-east-1"
}

resource "aws_vpc" "vpc-block" {
    cidr_block = "192.168.0.0/16"
    enable_dns_hostnames = true
    tags = {
        Name = "myvpc"
	Owner = "Hemanth Varma"
	environment = "dev"
    }
}

resource "aws_internet_gateway" "IGW-block" {
    vpc_id = "${aws_vpc.vpc-block.id}"
    tags = {
        Name = "myigw"
    }
  
}

resource "aws_subnet" "public-subnet1" {
    vpc_id = "${aws_vpc.vpc-block.id}"
    cidr_block = "192.168.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "mypubsub1"
    }

}

resource "aws_subnet" "public-subnet2" {
    vpc_id = "${aws_vpc.vpc-block.id}"
    cidr_block = "192.168.1.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "mypubsub2"
    }

}

resource "aws_route_table" "RT-Block" {
  vpc_id = aws_vpc.vpc-block.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW-block.id
  }

  tags = {
    Name = "myrt"
  }
}

resource "aws_route_table_association" "RT-Block" {
    subnet_id = "${aws_subnet.public-subnet1.id}"
    route_table_id = "${aws_route_table.RT-Block.id}"
}
