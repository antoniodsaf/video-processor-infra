# Banco de dados - RDS - PostgreSQL (videoprocessor-app)

Este repositorio contem informacoes relevantes sobre o banco de dados da aplicacao videoprocessor-app e codigo terraforms responsavel por subir uma instancia de postgres na AWS (utilizando o servico Amazon RDS).

## Detalhes do RDS

Detalhes da instancia:
- Nome da instancia: videoprocessor-db
- Classe (**Instance Class**): db.t3.micro
- Nome do banco de dados (**DB Name**): videoprocessor
- Versão do mecanismo (**Engine Version**): 14
- IDs do grupo de segurança da VPC (**VPC Security Group IDs**):     sg-0af8c2b09564180ff, sg-0cc77bd74b5a59e66
- Nome do grupo de sub-redes do DB (**DB Subnet Group Name**): videoprocessor-db-subnet-group

## Motivação de adotar um banco de dados relacional (postgresql)

- **Escalabilidade**: PostgreSQL pode lidar com grandes volumes de dados e usuários simultâneos, o que é essencial para um aplicativo de fast food que pode ter muitos pedidos acontecendo ao mesmo tempo.

- **Flexibilidade**: Suporta uma variedade de tipos de dados, incluindo JSON, permitindo maior flexibilidade para armazenar dados complexos, como preferências do cliente e histórico de pedidos.

- **Integridade dos Dados**: Bancos de dados relacionais garantem a integridade e a consistência dos dados através de transações ACID (Atomicidade, Consistência, Isolamento, Durabilidade).

- **Transações ACID**: Garantindo a consistência e integridade dos dados, essencial para operações críticas como a gestão de pedidos e inventário.

- **Extensibilidade**: Você pode adicionar novas funcionalidades, como tipos de dados personalizados e funções, que podem ser úteis para integrar novas características ao seu aplicativo.

- **Consultas SQL**: Utiliza SQL, uma linguagem de consulta poderosa e amplamente conhecida que facilita operações complexas, análises e consultas ad-hoc

- **Comunidade e Suporte**: PostgreSQL tem uma comunidade ativa e extensa documentação, facilitando a resolução de problemas e a implementação de novas funcionalidades.

## Motivação de utilizar Amazon RDS com pgsql

- **Facilidade de Gestão**: O Amazon RDS automatiza tarefas rotineiras de banco de dados, como provisionamento, aplicação de patches, backup e recuperação, permitindo que você se concentre em suas aplicações.

- **Escalabilidade**: Escalonamento do banco de dados PostgreSQL para cima ou para baixo com facilidade, conforme a necessidade de sua aplicação, sem nenhum tempo de inatividade.

- **Alta Disponibilidade**: O Amazon RDS suporta implantações Multi-AZ, proporcionando alta disponibilidade e suporte a failover para seus bancos de dados PostgreSQL.

- **Segurança**: O Amazon RDS oferece criptografia em repouso e em trânsito, junto com isolamento de rede usando Amazon VPC, garantindo que seus dados estejam seguros.

- **Monitoramento de Desempenho**: Com o Amazon CloudWatch, você pode monitorar o desempenho do seu banco de dados PostgreSQL e configurar alarmes para detectar e responder rapidamente a problemas.

