# Projeto de Infraestrutura com Terraform

## Descrição do Projeto

Este projeto utiliza **Terraform** para provisionar uma infraestrutura de nuvem na AWS.
## Estrutura do Projeto

### VPC
Cria a rede virtual onde outros recursos são implementados, juntamente com um Internet Gateway para comunicação externa.

### Subnets
Define subnets públicas e privadas para segmentação de rede, com grupos de subnets para aplicação e banco de dados.

### Grupos de Segurança
Configuração de grupos de segurança para controle de acesso à rede das instâncias EC2, RDS e Load Balancer, garantindo que apenas o tráfego permitido alcance esses recursos.

### S3 e CloudFront
Criação de um bucket S3 para armazenamento de dados.

### RDS
Banco de dados RDS com usuário e senha gerados aleatoriamente para maior segurança.

### EC2
Configuração de instâncias EC2 com balanceamento de carga para suporte à aplicação.

### Load Balancer
Criação de Load Balancer para distribuir o tráfego entre as instâncias EC2.

## Arquivos do Projeto

- **main.tf**: Configuração principal do projeto, incluindo o provedor e as tags padrão.
- **vpc.tf**: Configuração da VPC e do Internet Gateway.
- **subnets.tf**: Criação das subnets públicas e privadas e do grupo de subnets para o banco de dados RDS.
- **security_groups.tf**: Configuração dos grupos de segurança para as instâncias EC2, RDS e Load Balancer.
- **s3.tf**: Configuração do bucket S3 e sua política de acesso.
- **rds.tf**: Configuração do banco de dados RDS, com uso de `random_string` e `random_password` para gerar o usuário e a senha.
- **ec2.tf**: Configuração das instâncias EC2 que hospedam a aplicação.
- **load_balancer.tf**: Configuração do Load Balancer.
- **cloudfront.tf**: Configuração do CloudFront para o bucket S3 e o Load Balancer.
- **outputs.tf**: Exposição dos IDs de recursos essenciais configurados no projeto.
- **variables.tf**: Definição das variáveis do projeto.
- **locals.tf**: Política local de acesso para o CloudFront ao bucket S3.

## Destaque de Segurança

### Usuário e Senha Aleatórios para o RDS

O usuário e a senha para o banco de dados RDS são gerados de forma aleatória utilizando os recursos `random_string` e `random_password`. Isso garante a criação de credenciais únicas para o banco de dados a cada execução, melhorando a segurança e evitando a necessidade de definir ou compartilhar credenciais fixas.

## Como Executar o Projeto

1. **Instalar o Terraform** (versão >= 1.2.0)
2. **Configurar as Credenciais AWS** na máquina local.
3. **Clonar o Repositório**.
4. Executar os comandos a seguir:
   ```sh
   terraform init
   terraform validate
   terraform plan
   terraform apply
