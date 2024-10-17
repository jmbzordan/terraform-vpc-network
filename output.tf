# Criação de outputs que serão utilizados no exercício de criação de instância EC2
output "subnet_id" {
  description = "ID da subnet VPC criada na AWS"
  value = aws_subnet.subnet.id              #Printa o ID da subnet
}

output "security_group_id" {
  description = "ID da Security Group criada na AWS"
  value = aws_security_group.securitygroup.id     #Printa ID do security Group
}