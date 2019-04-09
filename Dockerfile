FROM hashicorp/terraform:light as build

RUN ls -l
#RUN mkdir /workspace
COPY modules/aws/free-tier /workspace
WORKDIR /workspace
RUN ls -l

RUN terraform init
RUN terraform plan \
        -var "AWS_SECRET_KEY_ID=$AWS_SECRET_KEY_ID" \
        -var "AWS_SECRET_KEY=$AWS_SECRET_KEY"
