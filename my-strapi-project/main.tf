provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "StrapiEC2" {
  ami           = "ami-008bded58ccb2f6f0" # Amazon Linux 2 AMI
  instance_type = "t3.micro"
  key_name      = "naveen-key-pair"

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -a -G docker ec2-user
              docker login -u balagouninaveen -p bNAVEEN@507
              docker pull balagouninaveen/strapi-app
              docker run -d -p 80:1337  balagouninaveen/strapi-app
              EOF

  tags = {
    Name = "StrapiServer"
  }
}
