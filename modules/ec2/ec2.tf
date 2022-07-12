#---reference modules---
  module "secgroup" {
    source = "../secgroup"
} 
  module "eip" {
    source = "../eip"
} 
#---create control plane---
 resource "aws_instance" "k8s-CP1" {
    ami = lookup(var.ami,"cp")
    instance_type = lookup(var.ami_size,"cp")
    vpc_security_group_ids = [module.secgroup.sg_id]
    tags = {
     Owner = "Kubernetes"
     Service = "k8s-cluster"
     Creator = "terraform"
     Name = element(var.ami_cp_names,0)
    }
 }
#---create workers---
 resource "aws_instance" "k8s-Workers" {
    ami = lookup(var.ami,"workers")
    instance_type = lookup(var.ami_size,"workers")
    vpc_security_group_ids = [module.secgroup.sg_id]
    count = 3 #<You may want to change # of resources created here>
    tags = {
     Owner = "Kubernetes"
     Service = "k8s-cluster"
     Creator = "terraform"
     Name = "workernode${count.index}"
    }
 }
#---associate newly created EIP to Control Plane---
 resource "aws_eip_association" "eip_assoc" {
   instance_id   = aws_instance.k8s-CP1.id
   allocation_id = module.eip.awseipcpid
 }





 