terraform {
  backend "s3" {
    bucket = "terraform.state123"
    region = "ap-southeast-1"
    key = "terraform.tfstate" 
    access_key = "AKIAXCBJZCNLRPOBT5P7"
    secret_key = "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"
  }
}
