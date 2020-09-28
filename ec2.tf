provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "my_ec2" {
  count           = 2
  ami             = "ami-0bb3fad3c0286ebd5"
  subnet_id       = "subnet-42641b18"
  instance_type   = "t2.micro"
  key_name        = "bade4times"
  security_groups = ["launch-wizard-6"]
  tags = {
    "Name" = "bade4times-${count.index + 1}"
  }
}

output "ec2_id" {
  value = aws_instance.my_ec2.*.id
}

output "ec2_id_1" {
  value = aws_instance.my_ec2[0].id
}

output "ec2_id_2" {
  value = aws_instance.my_ec2[1].id
}