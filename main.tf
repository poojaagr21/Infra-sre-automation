resource "aws_instance" "my_ec2_instance" {
	ami = "ami-05dc67d613ea82750"
	instance_type = "t3.micro"

	tags = {
		Name = "MyFirstEC2"
	}
}

