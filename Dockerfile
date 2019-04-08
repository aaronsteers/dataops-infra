FROM hashicorp/terraform:light as build

COPY modules/aws/free-tier/ .
RUN terraform plan
