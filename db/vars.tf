variable "region" {
    type    = string
    default = "us-east-1"
}

variable "aws_db_subnet_group_name" {
    type     = string
    default  = "videoprocessor-db-subnet-group"
}

variable "db_identifier" {
    type = string
    default = "videoprocessor-db"
}

variable "db_allocated_storage" {
    type = number
    default = 20
}

variable "db_name" {
    type = string
    default = "videoprocessor"
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = [
    "sg-0e67abfa8137a325b",
    "sg-05436a7f646278b30",
    "sg-093c28a382fe8dbb6",
  ]
}
variable "database_credentials_arn" {
    type = string
    default = "arn:aws:secretsmanager:us-east-1:831454666237:secret:videoprocessor-secret-8RnIQX" #"arn:aws:secretsmanager:us-east-1:152915761077:secret:database_credentials-dQSr8o"
}