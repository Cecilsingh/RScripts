# Connecting an R session to AWS S3

This guide explains how to connect RStudio Workbench (formerly RStudio Server Pro) or RStudio Connect to AWS S3.

## Prerequisites

Before you begin, ensure you have the following:

- **AWS S3 Bucket**: An S3 bucket created in your AWS account.
- **AWS Credentials**: Access key ID and secret access key for your AWS account or IAM user.

## Connect to S3

### Access Keys

Install the `aws.s3` package in R:

```
install.packages("aws.s3")
```

From there, we can use this library within our session:
```
library(aws.s3)
```

Once complete, we need to ensure that we have associated our appropriate RBAC (role-based access control) account to our R session. To do so, you can set the following variables within your environment using the R terminal:
```
Sys.setenv(
"AWS_ACCESS_KEY_ID" = "0000000",
"AWS_SECRET_ACCESS_KEY"= "000000",
"AWS_DEFAULT_REGION" = "us-west-2",
"AWS_SESSION_TOKEN" = "0000000")
```
Note that the zeros used in the above are simply placeholders. You will need to replace the values within the quotation marks with the values that correspond to your AWS account. The region used is also a placeholder, you will need to change this if it is different to Oregon (us-west-2).

### IAM Role
A solution to using an IAM role may be to use the aws.s3 and aws.ec2metadata packages. This package pulls EC2 instance metadata from within the running instance. It's worth noting that this requires the EC2 host to have access to the AWS CLI which can be installed as specified by AWS here:
https://aws.amazon.com/cli/


Once installed, you can verify that you're connected to your AWS account via the linux command line by running:
```
aws sts get-caller-identity
```
Once verified, you can connect your R session to instance metadata. To do so, you will first need to install the aws.s3 and aws.ec2metadata packages. You can do this by running the commands below:
```
install.packages("aws.s3")
install.packages("aws.ec2metadata")
library(aws.s3)
library(aws.ec2metadata)
Sys.setenv("AWS_DEFAULT_REGION" = 'us-east-1')
```
In the code block above, us-east-1 is an example - you will need to change this value to suit your S3 environment.

Testing
Once you've run the commands above, you can begin pulling data from S3! You can start by listing your buckets using the command below:
```
bucketlist()
```
