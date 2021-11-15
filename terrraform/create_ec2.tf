provider "aws" {
    region = var.region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    token = var.aws_session_token
}
resource "aws_instance" "myFirstInstance" {

  ami           = "ami-083654bd07b5da81d"
  count =1

  key_name = "ec2-instance"

  instance_type = "t2.micro"

  security_groups= [ "security_jenkins_port"]

  tags= {

    Name = "jenkins_instance"

  }

}

resource "aws_security_group" "security_jenkins_port" {

  name        = "security_jenkins_port"

  description = "security group for jenkins"



  ingress {

    from_port   = 8080

    to_port     = 8080

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }



 ingress {

    from_port   = 22

    to_port     = 22

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }



 # outbound from jenkis server

  egress {

    from_port   = 0

    to_port     = 65535

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }



  tags= {

    Name = "security_jenkins_port"

  }

}
