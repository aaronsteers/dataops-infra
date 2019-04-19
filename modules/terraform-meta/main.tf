provider "aws" {
  region = "${var.AWS_REGION}"
}

resource "aws_s3_bucket" "terradata_s3_config" {
    bucket_prefix = "terradata_config-"
    
}
