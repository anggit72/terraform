# NAT Instance
#
resource "aws_eip" "nat" {}
resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.demo_public.id}"

  tags = {
    Name = "gw NAT"
  }
}

