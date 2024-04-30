resource "aws_nat_gateway" "gw1" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.public1.id
  #   depends_on = [aws_eip.nat1]

  tags = {
    Name = "NAT 1"
  }
}

resource "aws_nat_gateway" "gw2" {
  allocation_id = aws_eip.nat2.id
  subnet_id     = aws_subnet.public2.id
  #   depends_on = [aws_eip.nat2]

  tags = {
    Name = "NAT 2"
  }
}