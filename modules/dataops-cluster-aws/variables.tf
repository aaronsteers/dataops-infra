variable "AWS_ACCESS_KEY_ID" {
  description = "Key ID for AWS key pair"
  default     = ""
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "Secret key for AWS key pair"
  default     = ""
}

variable "AWS_REGION" {
  description = "AWS region to launch servers."
  default     = "us-west-2"
}

# Ubuntu Precise 12.04 LTS (x64)
variable "AWS_AMIS" {
  default = {
    eu-west-1 = "ami-674cbc1e"
    us-east-1 = "ami-1d4e7a66"
    us-west-1 = "ami-969ab1f6"
    us-west-2 = "ami-8803e0f0"
  }
}

variable "ec2_instance_type" {
  default = "t2.large"
}