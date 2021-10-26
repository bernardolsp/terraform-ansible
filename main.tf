provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "web" {
  count         = 1
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name= "KeyPair-AWS"


  tags = {
    Name = "WebServer"
  }

  provisioner "local-exec" {

    command = "sleep 60 && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook-starter.yml -i terraform.aws_ec2.yml -u ubuntu --key-file ~/.ssh/keypair-aws.pem" 

  }

}