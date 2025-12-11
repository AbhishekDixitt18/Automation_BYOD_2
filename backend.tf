terraform {
  backend "s3" {
    bucket         = "abhishek-dixit-terraform-state-bucket" # replace if needed
    key            = "prod/webserver/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "abhishek-dixit-terraform-lock-table" # replace if needed
    encrypt        = true
  }
}
