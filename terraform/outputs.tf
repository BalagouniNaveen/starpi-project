output "public_ip" {
  description = "Public IP of Strapi EC2"
  value       = aws_instance.strapi.public_ip
}
