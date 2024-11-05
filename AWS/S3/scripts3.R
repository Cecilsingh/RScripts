install.packages("aws.s3")

library(aws.s3)

Sys.setenv(
"AWS_ACCESS_KEY_ID" = "REDACTED",
"AWS_SECRET_ACCESS_KEY"= "REDACTED",
"AWS_DEFAULT_REGION" = "us-west-2",
"AWS_SESSION_TOKEN" = "REDACTED")
