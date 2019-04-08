FROM hashicorp/terraform:light as build

RUN ls -l
RUN mkdir /workspace
RUN cd /workspace
COPY modules/aws/free-tier/* /workspace/
RUN ls -l

RUN terraform init
RUN terraform plan \
        -var "key_name=$AWS_SECRET_KEY_ID" \
        -var "key_value=$AWS_SECRET_KEY"
