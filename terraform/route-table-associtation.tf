resource "aws_route_table_association" "r_public_1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "r_public_2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "r_private_1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.rt_private_1.id
}

resource "aws_route_table_association" "r_private_2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.rt_private_2.id
}