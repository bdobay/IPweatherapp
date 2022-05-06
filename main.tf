
variable "numInstance" {
  type = number
  default = "2"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Redhat" {
ami = "ami-03ededff12e34e59e"
instance_type = "t2.micro"
key_name = "AppMachines"
security_groups = ["default"]
count = var.numInstance
subnet_id = "subnet-0d70c33cbeb941fed"
}



resource "aws_lb_target_group_attachment" "test" {
  count = var.numInstance
  target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:128570722676:targetgroup/testgroup/080953d9e5b2998d"
  target_id        = aws_instance.Redhat[count.index].id
  port             = 5004
}


resource "aws_lb" "test" {
  name               = "testLoadBalancer"
  internal           = false
  load_balancer_type = "network"
  
  subnet_mapping {
    subnet_id            = "subnet-0d70c33cbeb941fed"
  }

}


resource "aws_lb_listener" "testListener" {
  load_balancer_arn = aws_lb.test.arn
  port              = "5004"
  protocol          = "TCP"
  

  default_action {
    type             = "forward"
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:128570722676:targetgroup/testgroup/080953d9e5b2998d"
  }
}






output "instance_ip_addr" {
value = aws_instance.Redhat[*].private_ip

}
