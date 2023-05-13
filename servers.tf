resource "aws_instance" "app_server" {
  ami           = "ami-05e8e219ac7e82eba" # Ubuntu
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet-one.id
  key_name      = aws_key_pair.terraform_ec2_key.key_name
  security_groups = [
    aws_security_group.ingress-all-test.id
  ]

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
