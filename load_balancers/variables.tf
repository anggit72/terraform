variable "availability_zones" {
  # No spaces allowed between az names!
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

#
# From other modules
#
variable "public_subnet_id" {}
variable "webapp_http_inbound_sg_id" {}
