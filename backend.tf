terraform {
  backend "s3" {
    bucket = "terraform.state123"
    region = "ap-southeast-1"
    key = "terraform.tfstate" 
  }
}
