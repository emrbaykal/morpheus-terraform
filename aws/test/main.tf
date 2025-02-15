variable "access_key" {
  type        = string
}

variable "secret_key" {
  type        = string
}

provider "aws" {
  region = "eu-west-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-785db401"
  instance_type = "t2.micro"
  
}