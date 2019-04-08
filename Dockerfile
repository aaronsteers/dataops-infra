FROM hashicorp/terraform:light as build

COPY modules/aws/free-tier/* .
RUN dir
RUN terraform plan
