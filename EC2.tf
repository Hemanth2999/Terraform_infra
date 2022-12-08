resource "aws_instance" "web-1" {
    ami = "ami-0c21e27b9f2b36bcb"
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    key_name = "Mykey"
    subnet_id = "${aws_subnet.subnet1-public.id}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true	
    tags = {
         Name = "Server-1"
         Env = "Prod"
         Owner = "Hemanth"
	CostCenter = "ABCD"
     }
  }