  #---providers---
 terraform {
   required_providers {
     aws = {
       source = "hashicorp/aws"
       version = "4.19.0"
     }
   }
 }
 provider "aws" {
   region     = "us-east-1" #<you may want to change this to match your environment> 
 }
 