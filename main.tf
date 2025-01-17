provider "aws" {
  region = var.region
  profile = var.profile
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

data "aws_subnet" "example" {
  filter {
    #name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_subnet" "example2" {
  for_each = toset(data.aws_subnet.example.id)
  id       = each.value
}

output "subnet_cidr_blocks" {
  value = [for s in data.aws_subnet.example2 : s.cidr_block]
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name                 = var.instance_name
    "Linux Distribution" = "Ubuntu 18.04"
    "Class"              = "server"
  }
}
