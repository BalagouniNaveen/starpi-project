resource "aws_instance" "StrapiEC2" {
  ami           = "ami-008bded58ccb2f6f0" # Replace with your desired AMI ID
  instance_type = "t3.micro"
   key_name      = naveen-key-pair  # Provided to Terraform
  user_data = <<-EOF
              #!/bin/bash
              docker run -d -p 80:1337 your-dockerhub-username/strapi-app:latest
              EOF

  tags = {
    Name = "StrapiEC2"
  }
}



output "instance_public_ip" {
  value = aws_instance.strapi.public_ip
}
