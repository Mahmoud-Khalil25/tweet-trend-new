# steps to create VPC
/*
1- Create VPC
2- Create subnet
3- Create Internet gateway
4- Create Route Table
5- Create route table Associasion 
*/

resource "aws_vpc" "main" {
 cidr_block = var.vpc_cidr
 enable_dns_support   = true
 enable_dns_hostnames = true
 
 tags = {
   Name = "vpc-${local.name_prefix}"
 }
}
resource "aws_subnet" "public_subnet" {
  for_each = { for idx, cidr in var.public_subnets : idx => cidr }
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  availability_zone       = var.azs[tonumber(each.key)]
  map_public_ip_on_launch = true

  tags = {
    Name        = "public-${each.key}-${local.name_prefix}"
  }
}

resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main.id 
  tags = {
    Name = "igw-${local.name_prefix}"
  } 
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-igw.id
  }

  tags = {
    Name = "public-rt-${local.name_prefix}"
  }
}
resource "aws_route_table_association" "public-subnets-associasion" {
    for_each       = aws_subnet.public_subnet
    subnet_id      = each.value.id
    route_table_id = aws_route_table.public-rt.id

}

















