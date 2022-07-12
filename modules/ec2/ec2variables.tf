 #---lists---
 variable "ami_cp_names" {
   type = list
   default = ["k8s-CP1","k8s-CP2","k8s-CP3"]  #<If you have more than 3 control planes you will need to add entries here>
 }

 variable "ami_worker_names" {
   type = list
   default = ["k8s-worker1","k8s-worker2","k8s-worker3","k8s-worker4","k8s-worker5","k8s-worker6","k8s-worker7","k8s-worker8","k8s-worker9","k8s-worker10"] #<If you have more than 10 worker nodes you will need to add entries here>
 }
 #---maps---
 variable "ami" {
   type = map
   default = {
     "cp" = "ami-09d56f8956ab235b3"  #<??>-remember AMI must be present in the REGION you choose
     "workers" = "ami-09d56f8956ab235b3"  #<??>-remember AMI must be present in the REGION you choose
     #"workers" = ami = data.aws_ami.app_ami.id #<??> Uncomment to use data source  instead of specifying exact ami
     #"cp" = ami = data.aws_ami.app_ami.id #<??> Uncomment to use data source  instead of specifying exact ami
   }
 }
 variable "ami_size" {
   type = map
   default = {
     "cp" = "t2.medium" #<??> You may want to change size here
     "workers" = "t3.small" #<??> You may want to change size here
   }
 }