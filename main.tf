terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region     = "us-west-2"
  access_key = ""
  secret_key = ""

}

 resource "aws_key_pair" "ssh_key-tf" {
   key_name   = "ssh_key-tf"
   public_key = file("PATH_TO_KEY")
 }
