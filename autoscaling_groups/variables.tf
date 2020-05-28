variable "availability_zones" {
  # No spaces allowed between az names!
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}
variable "asg_min" {
  default = "4"
}
variable "asg_max" {
  default = "10"
}
#
# From other modules
#
variable "public_subnet_id" {}
variable "webapp_lc_id" {}
variable "webapp_lc_name" {}
variable "webapp_elb_name" {}
