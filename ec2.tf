resource "aws_instance" "My-web" {
  ami = "${var.amis}"
  availability_zone = "${var.azs}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  subnet_id = "${aws_subnet.public-subnet1.id}"
  vpc_security_group_ids = [ "${aws_security_group.SG-Block.id}" ]
  associate_public_ip_address = "true"

  tags = {
    Name = "server-1"
    Owner = "Hemanth"
    environment = "dev"
  }
}