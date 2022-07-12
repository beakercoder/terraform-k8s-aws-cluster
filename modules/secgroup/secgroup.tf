#---import module---
 module "eip" {
    source = "../eip"
}
#---create list variable for needed ports--
 variable "sg_ports" {
   type        = list(number)
   description = "list of ingress ports"
   default     = [80, 10250, 99, 2379, 2380, 2381, 2382, 2383 , 2384, 2385, 32750, 179, 3000, 8080, 4443, 443, 30000, 30001, 30002, 30003, 30004, 30005, 30006]
 }
#---create security group--
 resource "aws_security_group" "ec2-sg" {
   name        = "k8s-security-group"
   dynamic "ingress" {
     for_each = var.sg_ports
     iterator = port
     content {
       from_port   = port.value
       to_port     = port.value
       protocol    = "tcp"
       cidr_blocks = ["0.0.0.0/32"]
     }
   }

   dynamic "egress" {
     for_each = var.sg_ports
     content {
       from_port   = egress.value
       to_port     = egress.value
       protocol    = "tcp"
       cidr_blocks = ["0.0.0.0/32"]
     }
   }
#---add and secure ssh--
     ingress {
     from_port   = 22
     to_port     = 22
     protocol    = "tcp"
     cidr_blocks = ["xxx.xxx.xxx.xxx/32"]  #<CHANGEHERE> to match your environment
   }

    tags = {
     Owner = "Kubernetes"
     Service = "k8s-cluster"
     Creator = "terraform"
     Name = "SecGroup for k8s Cluster"
    }
 }
#---output new SG ID--
 output "sg_id" {
    value = aws_security_group.ec2-sg.id
 }