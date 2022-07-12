#---create new EIP---
  resource "aws_eip" "cp" {
    vpc      = true
     tags = {
      Owner = "Kubernetes"
      Service = "k8s-cluster"
      Creator = "terraform"
      Name = "EIP for k8s Control Plane"
     }
  }
#---output EIP ID---
  output "awseipcpid" {
    value = aws_eip.cp.id
  }
#---output EIP Public IP---
  output "awseipcppubip" {
    value = aws_eip.cp.public_ip
  }
