#---store state in S3 bucket and lock using DynamoDB table--
terraform {
  backend "s3" {
    bucket = "k8s-terraform-backend"#<--S3 bucket name
    key    = "k8s-cluster/terraform.tfstate" #<--you will need your own key here
    region = "us-east-1"#<-- you may want to change reason
    dynamodb_table = "terraform-statelock"#<-- you'll need to set this table up in your environment
  }
}
