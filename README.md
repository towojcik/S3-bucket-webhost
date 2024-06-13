Terraform Repository for Creating an S3 Bucket in AWS

This repository contains Terraform files that can be used to create an S3 Bucket in AWS. The S3 Bucket can be used to host static websites.

### Requirements

  >- AWS account
  >- Terraform installed
  >- AWS CLI configured

## 1. Quick Start

### Clone the repository:

    git clone git@gitlab.com:towojcik/s3-bucket-webhost.git

#### Change directory to terraform:

    cd terraform

## 2. Terraform

Edit an terraform.tfvars file and define the variables. Default value is set in terraform.tfvars as "s3-website-bucket-666".

### Initialize Terraform:

    terraform init

### Create the S3 Bucket:

    terraform plan
    terraform apply

### TIP

You don't need to edit terraform.tfvars file. You can iniect a variables in terraform command
> Exapmle:
> 
>     terraform plan -var bucket_name="YOU_BUCKET_NAME"
>     terraform apply -var bucket_name="YOU_BUCKET_NAME"

## 3. AWS

Open the AWS console and go to S3. You should see the created bucket.


### More Information

  - Terraform documentation: https://www.terraform.io/docs/
  - S3 documentation: https://docs.aws.amazon.com/s3/

### Note

This repository is an example and may require modification depending on your needs.

### Files

>  - provider.tf: Terraform file with provider and backend definition.
>  - bucket.tf: Terraform file with S3 Bucket configuration
>  - variables.tf: Configuration variables file
>  - terraform.tfvars: Default variables
>  - output.tf: Terraform outpul file