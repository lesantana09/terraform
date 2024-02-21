terraform {
  backend "s3" {
    bucket = "terraform-state-alura-leandro-v2"
    key    = "prod/terraform.tfstate"
    region = "us-west-2"
  }
}