provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "StrapiEC2" {
  ami           = "ami-008bded58ccb2f6f0"    # Replace with region-specific Ubuntu AMI
  instance_type = "t3.micro"
  key_name      = naveen-key-pair  # Provided to Terraform

  user_data = file("${path.module}/user-data.sh")

  tags = {
    Name = "StrapiEC2"
  }

  provisioner "remote-exec" {
    inline = [
      "docker pull balagouninaveen/strapi-app:${var.docker_image_tag}",
      "docker stop strapi || true",
      "docker rm strapi || true",
      "docker run -d --name strapi -p 80:1337 balagouninaveen/strapi-app:${var.docker_image_tag}"
    ]

    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
    }
  }
}

output "instance_public_ip" {
  value = aws_instance.strapi.public_ip
}
