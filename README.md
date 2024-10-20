# terraform-aws-ec2
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | = 5.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/hashicorp/aws/5.67.0/docs/resources/internet_gateway) | resource |
| [aws_route_table.routetable](https://registry.terraform.io/providers/hashicorp/aws/5.67.0/docs/resources/route_table) | resource |
| [aws_route_table_association.rta](https://registry.terraform.io/providers/hashicorp/aws/5.67.0/docs/resources/route_table_association) | resource |
| [aws_security_group.securitygroup](https://registry.terraform.io/providers/hashicorp/aws/5.67.0/docs/resources/security_group) | resource |
| [aws_subnet.subnet](https://registry.terraform.io/providers/hashicorp/aws/5.67.0/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/5.67.0/docs/resources/vpc) | resource |
| [aws_vpc_security_group_ingress_rule.sg_ingress](https://registry.terraform.io/providers/hashicorp/aws/5.67.0/docs/resources/vpc_security_group_ingress_rule) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | ID da Security Group criada na AWS |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | ID da subnet VPC criada na AWS |
<!-- END_TF_DOCS -->