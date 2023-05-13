provider "aws" {
  region                   = "eu-west-3"
  profile                  = "default"
  shared_credentials_files = [".aws/credentials.toml"]
}
