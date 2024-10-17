#Prática de criação de bucket AWS

terraform {

  # required_version = "= 1.3.0"                 Versão precisa ser igual a 1.3.0
  # required_version = ">= 1.0.0, < 1.3.0"       Versão pode ser maior ou igual a 1.0.0 e menor que 1.3.0
  # required_version = "~> 1.0.0"                #Versão pode ser de 1.0.0 até 1.0.n, n=maior versao de patch

  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.67.0"
    }
  }
  # https://developer.hashicorp.com/terraform/language/backend/s3
  # Declaração de um backend para armazenamento remoto do arquivo de state
  backend "s3" {
     
     # Backend referencia para bucket do exercicio de remote state feito em outro codigo terraform
     bucket = "johnz-remote-state"          # Nome do bucket em bucket.tf que armazenara o arquivo de state
     key  = "aws-vpc/terraform.tfstate"  # Path do arquivo de state para o exemplo de criação da vpc do curso
     region = "sa-east-1"  
  }
}


#https://registry.terraform.io/providers/hashicorp/aws/latest/docs
#Documentação com referência de argumentos declaráveis para o bloco provider AWS
provider "aws" {

  #https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html
  #Documentação com a lista de regiões disponíveis na AWS
  region = "sa-east-1"

  # AWS permite a declaração de tags default no bloco provider, ao contrário da Azure, por exemplo
  default_tags {
    tags = {
      owner      = "joaozordan"
      managed-by = "terraform"
    }
  }
}