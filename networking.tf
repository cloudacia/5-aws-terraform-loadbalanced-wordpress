###############################################
#   AWS VPC                                   #
###############################################

resource "aws_vpc" "vpc_dev" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "VPC for Development"
  }
}

###############################################
#   AWS SUBNET #1                             #
###############################################
resource "aws_subnet" "subnet01" {
  vpc_id            = aws_vpc.vpc_dev.id
  cidr_block        = var.subnet01
  availability_zone = var.availability_zone01

  tags = {
    Name = "Subnet01"
  }
}

###############################################
#   AWS SUBNET #2                             #
###############################################
resource "aws_subnet" "subnet02" {
  vpc_id            = aws_vpc.vpc_dev.id
  cidr_block        = var.subnet02
  availability_zone = var.availability_zone01

  tags = {
    Name = "Subnet02"
  }
}

###############################################
#   AWS SUBNET #3                             #
###############################################
resource "aws_subnet" "subnet03" {
  vpc_id            = aws_vpc.vpc_dev.id
  cidr_block        = var.subnet03
  availability_zone = var.availability_zone02

  tags = {
    Name = "Subnet03"
  }
}

###############################################
#   AWS SUBNET #4                             #
###############################################
resource "aws_subnet" "subnet04" {
  vpc_id            = aws_vpc.vpc_dev.id
  cidr_block        = var.subnet04
  availability_zone = var.availability_zone02

  tags = {
    Name = "Subnet04"
  }
}

###############################################
#   AWS SUBNET #5                             #
###############################################
resource "aws_subnet" "subnet05" {
  vpc_id            = aws_vpc.vpc_dev.id
  cidr_block        = var.subnet05
  availability_zone = var.availability_zone01

  tags = {
    Name = "Subnet05"
  }
}

###############################################
#   AWS SUBNET #6                             #
###############################################
resource "aws_subnet" "subnet06" {
  vpc_id            = aws_vpc.vpc_dev.id
  cidr_block        = var.subnet06
  availability_zone = var.availability_zone02

  tags = {
    Name = "Subnet06"
  }
}

###############################################
#   AWS ROUTING TABLE #1                      #
###############################################
resource "aws_route_table" "rt01" {
  vpc_id = aws_vpc.vpc_dev.id

  tags = {
    Name = "Routing Table #1"
  }
}

###############################################
#   AWS ROUTING TABLE #2                      #
###############################################
resource "aws_route_table" "rt02" {
  vpc_id = aws_vpc.vpc_dev.id

  tags = {
    Name = "Routing Table #2"
  }
}

###############################################
#   AWS ROUTING TABLE #3                      #
###############################################
resource "aws_route_table" "rt03" {
  vpc_id = aws_vpc.vpc_dev.id

  tags = {
    Name = "Routing Table #3"
  }
}

###############################################
#   AWS ROUTING TABLE #4                      #
###############################################
resource "aws_route_table" "rt04" {
  vpc_id = aws_vpc.vpc_dev.id

  tags = {
    Name = "Routing Table #4"
  }
}

###############################################
#   AWS ROUTE ASSOCIATION #1                  #
###############################################
resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.subnet01.id
  route_table_id = aws_route_table.rt01.id
}

###############################################
#   AWS ROUTE ASSOCIATION #2                  #
###############################################
resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.subnet02.id
  route_table_id = aws_route_table.rt02.id
}

###############################################
#   AWS ROUTE ASSOCIATION #3                  #
###############################################
resource "aws_route_table_association" "rta3" {
  subnet_id      = aws_subnet.subnet03.id
  route_table_id = aws_route_table.rt01.id
}

###############################################
#   AWS ROUTE ASSOCIATION #4                  #
###############################################
resource "aws_route_table_association" "rta4" {
  subnet_id      = aws_subnet.subnet04.id
  route_table_id = aws_route_table.rt03.id
}

###############################################
#   AWS ROUTE ASSOCIATION #5                  #
###############################################
resource "aws_route_table_association" "rta5" {
  subnet_id      = aws_subnet.subnet05.id
  route_table_id = aws_route_table.rt04.id
}

###############################################
#   AWS ROUTE ASSOCIATION #6                  #
###############################################
resource "aws_route_table_association" "rta6" {
  subnet_id      = aws_subnet.subnet06.id
  route_table_id = aws_route_table.rt04.id
}

############################################################
#   AWS ROUTE SETTING AN INTERNET GATEWAY AS DEFAULT ROUTE #
############################################################
resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.rt01.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}

############################################################
#   AWS ROUTE SETTING A NAT GATEWAY AS DEFAULT ROUTE       #
############################################################
resource "aws_route" "nat_gateway01" {
  route_table_id         = aws_route_table.rt02.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.gw01.id
}

############################################################
#   AWS ROUTE SETTING A NAT GATEWAY AS DEFAULT ROUTE       #
############################################################
resource "aws_route" "nat_gateway02" {
  route_table_id         = aws_route_table.rt03.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.gw02.id
}

###############################################
#   AWS INTERNET GATEWAY                      #
###############################################
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc_dev.id

  tags = {
    Name = "Internet Gateway"
  }
}

###############################################
#   AWS NAT GATEWAY                           #
###############################################
resource "aws_nat_gateway" "gw01" {
  allocation_id = aws_eip.ip_nat01.id
  subnet_id     = aws_subnet.subnet01.id

  tags = {
    Name = "NAT Gateway #1"
  }

  depends_on = [aws_internet_gateway.ig]
}

###############################################
#   AWS NAT GATEWAY                           #
###############################################
resource "aws_nat_gateway" "gw02" {
  allocation_id = aws_eip.ip_nat02.id
  subnet_id     = aws_subnet.subnet03.id

  tags = {
    Name = "NAT Gateway #2"
  }

  depends_on = [aws_internet_gateway.ig]
}

###############################################
#   AWS ELASTIC IP ADDRESS                    #
###############################################
resource "aws_eip" "ip_nat01" {
  vpc = true

  tags = {
    Name = "NAT Gateway #1"
  }
}

###############################################
#   AWS ELASTIC IP ADDRESS                    #
###############################################
resource "aws_eip" "ip_nat02" {
  vpc = true

  tags = {
    Name = "NAT Gateway #2"
  }
}
