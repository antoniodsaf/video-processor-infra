# video-processor-infra

![AWS Infra](/docs/aws-infra.png)

Este repositorio é responsável por armazenar scripts terraforms para montar a infraestrutura descrita acima.

- EKS

Pasta onde contém as configurações responsáveis por criar um novo cluster EKS e outros importantes recursos essenciais pra que os microserviços sejam capazes de serem executados.

- DB

Pasta onde contém as configurações responsáveis por criar um novo postgres db (em cima do RDS da aws).