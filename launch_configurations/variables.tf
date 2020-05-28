variable "region" {
  default = "ap-southeast-1"
}

variable "key_name" {}

variable "instance_type" {
  default = "t2.nano"
}

# Amazon Linux AMI
# Most recent as of 2015-12-02
variable "amis" {
  default = {
    ap-southeast-1 = "ami-fa08bc99"
    ap-southeast-1 = "ami-fa08bc99"
  }
}

#
# From other modules
#
variable "webapp_http_inbound_sg_id" {}

variable "webapp_ssh_inbound_sg_id" {}
variable "webapp_outbound_sg_id" {}
