provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Redhat" {
ami = "ami-03ededff12e34e59e"
instance_type = "t2.micro"
key_name = "AppMachines"
security_groups = ["default"]
count = 2
}




output "instance_ip_addr" {
value = aws_instance.Redhat[*].public_ip

}
