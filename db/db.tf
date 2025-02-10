data "aws_secretsmanager_secret_version" "database_credentials" {
  secret_id = var.database_credentials_arn
}

resource "aws_db_subnet_group" "database" {
  name       = var.aws_db_subnet_group_name
  subnet_ids = [for subnet in data.aws_subnet.subnet : subnet.id if subnet.availability_zone != "${var.region}e"]
}

data "aws_security_groups" "all_sgs" {}



resource "aws_db_instance" "database_videoprocessor" {
  identifier                    = jsondecode(data.aws_secretsmanager_secret_version.database_credentials.secret_string)["DATABASE_NAME"]
  allocated_storage             = var.db_allocated_storage
  db_name                       = jsondecode(data.aws_secretsmanager_secret_version.database_credentials.secret_string)["DATABASE_NAME"]
  engine                        = "postgres"
  engine_version                = "14"
  instance_class                = "db.t3.micro"
  username                      = jsondecode(data.aws_secretsmanager_secret_version.database_credentials.secret_string)["DATABASE_USER"]
  password                      = jsondecode(data.aws_secretsmanager_secret_version.database_credentials.secret_string)["DATABASE_PASS"]
  skip_final_snapshot           = true
  allow_major_version_upgrade   = true
  db_subnet_group_name          = aws_db_subnet_group.database.name
  apply_immediately             = true
  vpc_security_group_ids        = data.aws_security_groups.all_sgs.ids #var.vpc_security_group_ids
  publicly_accessible           = true
}

#resource "aws_db_instance" "database_order" {
#  identifier                    = jsondecode(data.aws_secretsmanager_secret_version.database_credentials.secret_string)["DATABASE_ORDER_NAME"]
#  allocated_storage             = var.db_allocated_storage
#  db_name                       = jsondecode(data.aws_secretsmanager_secret_version.database_credentials.secret_string)["DATABASE_ORDER_NAME"]
#  engine                        = "postgres"
#  engine_version                = "14"
#  instance_class                = "db.t3.micro"
#  username                      = jsondecode(data.aws_secretsmanager_secret_version.database_credentials.secret_string)["DATABASE_USER"]
#  password                      = jsondecode(data.aws_secretsmanager_secret_version.database_credentials.secret_string)["DATABASE_PASS"]
#  skip_final_snapshot           = true
#  allow_major_version_upgrade   = true
#  db_subnet_group_name          = aws_db_subnet_group.database.name
#  apply_immediately             = true
#  vpc_security_group_ids        = var.vpc_security_group_ids
#}
#
#resource "aws_db_instance" "database_payment" {
#  identifier                    = jsondecode(data.aws_secretsmanager_secret_version.database_credentials.secret_string)["DATABASE_PAYMENT_NAME"]
#  allocated_storage             = var.db_allocated_storage
#  db_name                       = jsondecode(data.aws_secretsmanager_secret_version.database_credentials.secret_string)["DATABASE_PAYMENT_NAME"]
#  engine                        = "postgres"
#  engine_version                = "14"
#  instance_class                = "db.t3.micro"
#  username                      = jsondecode(data.aws_secretsmanager_secret_version.database_credentials.secret_string)["DATABASE_USER"]
#  password                      = jsondecode(data.aws_secretsmanager_secret_version.database_credentials.secret_string)["DATABASE_PASS"]
#  skip_final_snapshot           = true
#  allow_major_version_upgrade   = true
#  db_subnet_group_name          = aws_db_subnet_group.database.name
#  apply_immediately             = true
#  vpc_security_group_ids        = var.vpc_security_group_ids
#}