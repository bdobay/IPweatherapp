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



resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:128570722676:targetgroup/testgroup/080953d9e5b2998d"
  target_id        = "{$aws_instance.Redhat[1]}"
  port             = 5004
}




output "instance_ip_addr" {
value = aws_instance.Redhat[*].public_ip

}
