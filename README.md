# Terraform AWS EC2

## Tutorial followed to setup everything

[Link](https://medium.com/@hmalgewatta/setting-up-an-aws-ec2-instance-with-ssh-access-using-terraform-c336c812322f)

## Generate ssh keys

```bash
mkdir ssh_keys
ssh-keygen -o -a 256 -t ed25519 -f ssh_keys/terraform_ec2_key
```

## Connect via ssh

```bash
ssh -i ssh_keys/terraform_ec2_key ubuntu@13.36.100.132
```
