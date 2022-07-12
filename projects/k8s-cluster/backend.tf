#---store state in S3 bucket and lock using DynamoDB table--
terraform {
  backend "s3" {
    bucket = "k8s-terraform-backend"#<--S3 bucket name
    key    = "k8s-cluster/terraform.tfstate" #<--what to store and where to store in bucket.
    region = "us-east-1"#<-- you may want to change region
    dynamodb_table = "terraform-statelock"#<-- you'll need to set this table up in your environment
  }
}
