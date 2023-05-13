resource "aws_key_pair" "terraform_ec2_key" {
  key_name   = "terraform_ec2_key"
  public_key = file("ssh_keys/terraform_ec2_key.pub")
}
