resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc_cidr

    tags = {
      Name = var.vpc_name
    }
}

resource "aws_subnet" "mysub1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.sub1_cidr
    availability_zone = var.az1
    map_public_ip_on_launch = true

    tags = {
      Name = var.sub1_name
    }
}


resource "aws_subnet" "mysub2" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.sub2_cidr
    availability_zone = var.az2
    map_public_ip_on_launch = true

    tags = {
      Name = var.sub2_name
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.myvpc.id

    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "rta1" {
    subnet_id = aws_subnet.mysub1.id
    route_table_id = aws_route_table.rt.id
}


resource "aws_route_table_association" "rta2" {
    subnet_id = aws_subnet.mysub2.id
    route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "sg" {
    name = "Web-sg"
    description =   "Web security grp"
    vpc_id = aws_vpc.myvpc.id

    tags = {
      Name = var.sg_name
    }
}

resource "aws_vpc_security_group_ingress_rule" "ir1" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  to_port = 80
  ip_protocol = "tcp"
}


resource "aws_vpc_security_group_ingress_rule" "ir2" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 22
  to_port = 22
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "er" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}