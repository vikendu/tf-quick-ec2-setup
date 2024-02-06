# tf-quick-ec2-setup
##Using Terraform to quickly setup a testing env:

1. use `ssh-keygen -t rsa -b 4096` to generate a key pair and update the public key path in `main.tf`
2. add access & secret keys if they're not already set as env variables
3. login using `ssh -i "path_to_private_key" ec2-user@<public-ip>`
