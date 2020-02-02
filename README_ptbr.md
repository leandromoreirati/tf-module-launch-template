![alt text](https://www.terraform.io/assets/images/logo-hashicorp-3f10732f.svg)

# **tf-module-launch-template**

Módulo Terraform para criação ***Launch Template***.

  **Requisitos**
 - Terraform
 - AWS Account
  
**Dependências**
 - Security Group
 - IAM Role
 - IAM Instance Profile

**Exemplo de Uso**
 ------
```
module "launch_template" {
  source = "https://github.com/leandromoreirati/tf-module-launch_template.git"

  name       = "${var.my_team}-${var.product}-${var.environment}"

  vpc_id                = "${var.vpc_id}"
  azs                   = "${var.azs}"
  private_subnet        = "${var.private_subnet}"
  security_group_id     = "${var.security_group_id}"
  tenancy               = "${var.tenancy}"
  monitoring            = "${var.monitoring}"
  public_ip_association = "${var.public_ip_association}"
  ami                   = "${var.ami}" 
  instance_type         = "${var.instance_type}"
  key_name              = "${var.key_name}"
  volume_size           = "${var.volume_size}"
  volume_type           = "${var.volume_type}"
  device_name           = "${var.device_name}"
  delete_on_termination = "${var.delete_on_termination}"
  resource_type         = "${var.resource_type}"
  security_groups_id    = ["${module.security_group.security_group_id}"]

  tags = {
    "tag01"    = "value01"
    "tag02"    = "value02"
    "tag03"    = "value03"
    "tagN"     = "valueN"
  }

}

```
 **Variáveis**
 ------
 |         Nome         |                      Descrição                                                |  Default  |
 | -------------------- |-------------------------------------------------------------------------------|:---------:|
 | vpc_id               | ID da VPC                                                                     |    ""     |
 | azs                  | Zonas de disponibilidade                                                      |    ""     |
 | private_subnet       | ID das subnets                                                                |    ""     |
 | tenancy              | Tipo de alocação da instância                                                 |  default  |
 | monitoring           | Habilita o monitoramendo da instâncias                                        |   false   |
 | ami                  | ID da AMI                                                                     |    ""     |
 | instance_type        | Tipo de instância                                                             |    ""     |
 | key_name             | Nome da Key Pair                                                              |    ""     |
 | volume_size          | Tamanho do volume a ser alocado na instância                                  |     8     |
 | volume_type          | Tipo do volume a ser alocado na instâncias                                    |    gp2    |
 | device_name          | Mount point do volume a ser alocado na instância                              | /dev/sda1 |
 | delete_on_termination| Define se o volume será destruído após a finalização da instância             |   false   |
 | resource_type        | Tipo de recuros que receberá a tag                                            |  instance |

 **Outputs**
 ------
 |           Nome         |                   Valor                            |
 | ---------------------- |:--------------------------------------------------:|
 | launch_template_arn    | aws_launch_template.launch_template.arn            |
 | launch_template_version| aws_launch_template.launch_template.latest_version |
 | launch_template_name   | aws_launch_template.launch_template.name           |
 | launch_template_id     | aws_launch_template.launch_template.id             |
 | security_group         | aws_security_group.security_group.id               |

 **Documentação externa**
 - [Execução de uma instância a partir de um modelo de execução](https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/ec2-launch-templates.html)
 - [Terraform Launch Template](https://www.terraform.io/docs/providers/aws/r/launch_template.html)

 **Recursos Criados**
 ------
 - IAM Role
 - IAM Instance Profile
 - Security Group
 - Launch Template