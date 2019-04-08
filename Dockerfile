FROM hashicorp/terraform:light as build

RUN ls -l
#RUN mkdir /workspace
COPY modules/aws/free-tier /workspace
RUN cd /workspace
RUN ls -l

RUN terraform init
RUN terraform plan \
        -var "key_name=$AWS_SECRET_KEY_ID" \
        -var "key_value=$AWS_SECRET_KEY"
