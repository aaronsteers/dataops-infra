# Specify the provider and access details
provider "aws" {
  region = "${var.AWS_REGION}"
}

resource "aws_ecs_cluster" "my_ecs" {
  name = "my_ecs_cluster"
}

resource "aws_instance" "test_instances" {
  count = 1
  ami = "ami-8803e0f0"
  instance_type = "${var.ec2_instance_type}"
}
