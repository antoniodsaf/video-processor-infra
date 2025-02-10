terraform {
  backend "s3" {
    bucket = "videoprocessor-tf"
    key = "db/terraform.tfstate"
    region = "us-east-1"
  }
}