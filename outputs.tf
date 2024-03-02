output "public_ip-tf" {
  value = aws_instance.app_server[*].public_ip
}
