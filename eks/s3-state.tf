terraform {
  backend "s3" {
    bucket = "videoprocessor-tf"
    key = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}