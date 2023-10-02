resource "aws_internet_gateway" "fazle_IGW" {
  vpc_id = aws_vpc.fazle-vpc.id //dep
}