resource "aws_eip" "nat_eip" {
  count      = length(var.availability_zones)
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "natGw" {
  count         = length(var.availability_zones)
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = aws_subnet.public_subnets[count.index].id
  depends_on    = [aws_internet_gateway.igw]

  tags = {
    Name = "NAT_GW"
  }
}