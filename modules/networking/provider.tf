provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket         = "farruh-tfstate-part2"
    key            = "networking_part3.tf"
    region         = "eu-west-1"
    dynamodb_table = "part2locktable"
  }

  required_version = "= 1.3.7"
}
