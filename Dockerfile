FROM hashicorp/terraform:light as build

RUN ls -l
#RUN mkdir /workspace
COPY modules/aws/free-tier /workspace
WORKDIR /workspace
RUN ls -l

RUN terraform init
RUN terraform plan \
        -var "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" \
        -var "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY"
