resource "aws_vpc" "new-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "maestro-vpc"
  }
}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "new-subnet-1" {
  availability_zone = data.aws_availability_zones.available.names[0]
  vpc_id            = aws_vpc.new-vpc.id
  cidr_block        = "10.0.0.0/24"
  tags = {
    Name = "maestro-subnet-1"
  }
}

resource "aws_subnet" "new-subnet-2" {
  availability_zone = data.aws_availability_zones.available.names[1]
  vpc_id            = aws_vpc.new-vpc.id
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name = "maestro-subnet-2"
  }
}
