FROM hashicorp/terraform:light as build

COPY modules/aws/free-tier/* .
RUN ls -l

RUN terraform init
RUN terraform plan \
        -var "key_name=$AWS_SECRET_KEY_ID" \
        -var "key_value=$AWS_SECRET_KEY"
