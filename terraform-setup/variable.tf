variable "ami_id" {
	description = "AMI ID for the EC2 instance"
	type = string
}

variable "instance_type" {
	description = "Type of EC2 instance"
	type = string
	default = "t2.micro"

}

variable "aws_region" {
	description = "AWS region to deploy in"
	type = string
	default = "us-west-2"
}
