resource "aws_route_table" "Public_RT" {
  vpc_id = aws_vpc.fazle-vpc.id //dep
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.fazle_IGW.id
  }
}
//Associate RT with PS
resource "aws_route_table_association" "PRT_Associate" {
  subnet_id      = aws_subnet.fazle-subnet.id
  route_table_id = aws_route_table.Public_RT.id
}