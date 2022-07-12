
The scripts in this repo will create 1 Control Plane and 3 Worker nodes in AWS. 
The # of resources, region, AMI's are all configurable. 
See comments in scripts. The scripts included assume you are logged in on a machine with your AWS creds.

Usage:
Clone Repo
Make changes where necessary to fit your needs and environment
Change SSH entry in modules/secgroup/secgroup.tf to match your environment
In Projects/k8s-cluster directory
    terraform init 
    terraform plan (review before apply)
    terraform apply