resource "aws_instance" "app_server" {
  ami           = "ami-0ecb0bb5d6b19457a"
  instance_type = "t2.micro"
  key_name      = "ssh_key-tf"
  subnet_id     = aws_subnet.subnet-tf.id
  vpc_security_group_ids = [aws_security_group.allow_ssh_https.id]
  associate_public_ip_address = true

  tags = {
    Name = "aws-instance-tf"
  }
}
