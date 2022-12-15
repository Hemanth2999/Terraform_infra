provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secrete_key}"
    region = "${var.aws_region}"
}

resource "aws_vpc" "vpc-block" {
    cidr_block = "${var.aws_cidr_block}"
    enable_dns_hostnames = true
    tags = {
        Name = "${var.vpc_name}"
    }
}

resource "aws_internet_gateway" "IGW-block" {
    vpc_id = "${aws_vpc.vpc-block.id}"
	tags = {
        Name = "${var.aws_igw_name}"
    }
}

resource "aws_subnet" "public-subnet1" {
    vpc_id = "${aws_vpc.vpc-block.id}"
    cidr_block = "${var.aws_public_subnet1_cidr}"
    availability_zone = "us-east-1a"

    tags = {
        Name = "${var.aws_public_subnet1_name}"
    }
}

resource "aws_subnet" "public-subnet2" {
    vpc_id = "${aws_vpc.vpc-block.id}"
    cidr_block = "${var.aws_public_subnet2_cidr}"
    availability_zone = "us-east-1a"

    tags = {
        Name = "${var.aws_public_subnet2_name}"
    }
}

resource "aws_route_table" "RT-Block" {
    vpc_id = "${aws_vpc.vpc-block.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.IGW-block.id}"
    }

    tags = {
        Name = "${var.aws_route_table}"
    }
}

resource "aws_route_table_association" "RT-Block" {
    subnet_id = "${aws_subnet.public-subnet1.id}"
    route_table_id = "${aws_route_table.RT-Block.id}"
}

resource "aws_security_group" "SG-Block" {
  description = "sg"
  vpc_id      = "${aws_vpc.vpc-block.id}"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.aws_security_group}"
  }
}


resource "aws_instance" "My-web" {
  ami = "${var.amis}"
  availability_zone = "${var.azs}"
  instance_type = "${var.instance_type}"
  key_name = "${var.aws_key_name}"
  subnet_id = "${aws_subnet.public-subnet1.id}"
  vpc_security_group_ids = [ "${aws_security_group.SG-Block.id}" ]
  associate_public_ip_address = "true"

  tags = {
    Name = "server-1"
    Owner = "Hemanth"
    environment = "dev"
  }
}