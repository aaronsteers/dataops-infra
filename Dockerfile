FROM hashicorp/terraform:light as build

COPY . .
RUN terraform plan
