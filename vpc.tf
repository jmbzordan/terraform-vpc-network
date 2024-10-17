# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
# Documentação do provider AWS para criação de uma VPC

# Serão criados todos os componentes necessários para o funcionamento de uma VPC de acordo com a documentação acima
# Buscar os exemplos de declarações dos resources e também verificar os argumentos disponíveis - obrigatórios ou não

# resources necessários:
# VPC, Subnet, Internet Gateway, Route Table, Route Table Association e Security Group

# Declaração do resource VPC
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-terraform"   # Na AWS, quando uma tag Name é declarada, com N (maiusculo), o valor será o Nome de fato lá na console da AWS
  }
}


# Declaração do resource Subnet necessário para a VPC
resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id      # Referencia o atributo ID do resource aws_vpc, "vpc" criado anteriormente
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-terraform"   # Na AWS, quando uma tag Name é declarada, com N (maiusculo), o valor será o Nome de fato lá na console da AWS
  }
}


# Declaração do resource Internet Gateway necessário para a VPC
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id          # Referencia o atributo ID do resource aws_vpc, "vpc" criado anteriormente

  tags = {
    Name = "internet-gateway-terraform"
  }
}


# Declaração do resource Route Table necessário para a VPC
resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"               # Gateway aberto para internet
    gateway_id = aws_internet_gateway.gw.id      # Referencia o atributo ID do resource aws_internet_gateway, "gw" criado anteriormente
  }

  tags = {
    Name = "route-table-terraform"
  }
}


# Declaração do resource Route Table Association que associa uma Route Table a uma subnet
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet.id             # Referencia o atributo ID do resource aws_subnet, "subnet" criado anteriormente
  route_table_id = aws_route_table.routetable.id    # Referencia o atributo ID do resource aws_route_table, "routetable" criado anteriormente
}


# Declaração do resource Security Group necessário para a VPC
resource "aws_security_group" "securitygroup" {
  name        = "security_group"
  description = "Permite acesso na porta 22"
  vpc_id      = aws_vpc.vpc.id          # Referencia o atributo ID do resource aws_vpc, "vpc" criado anteriormente

/*
  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
*/
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  tags = {
    Name = "security-group-terraform"
  }
}


# Declaração de ingress Rule para security Group
resource "aws_vpc_security_group_ingress_rule" "sg_ingress" {
  security_group_id = aws_security_group.securitygroup.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

/*
# Declaração de egress Rule para security Group
resource "aws_vpc_security_group_egress_rule" "sg_egress" {
  security_group_id = aws_security_group.securitygroup.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"    # Equile a "todas as portas"
}
*/