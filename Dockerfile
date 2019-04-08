FROM hashicorp/terraform:light as build

COPY modules/aws/free-tier/* .
RUN ls -l

RUN terraform init
RUN terraform plan
