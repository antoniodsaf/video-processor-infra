variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "videoprocessor-cluster"
}

variable "lab_role" {
  default = "arn:aws:iam::831454666237:role/LabRole" 
  #"arn:aws:iam::152915761077:role/LabRole"
}

variable "access_config" {
  default = "API_AND_CONFIG_MAP"
}

variable "node_group" {
  default = "videoprocessor-node-group"
}

variable "instance_type" {
  default = "t2.large"
}

variable "principal_arn" {
  #default = "arn:aws:iam::152915761077:role/voclabs"
  default = "arn:aws:iam::831454666237:role/voclabs"
}

variable "policy_arn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "videoprocessor_credentials_arn" {
    type = string
    default = "arn:aws:secretsmanager:us-east-1:831454666237:secret:videoprocessor-secret-8RnIQX" #"arn:aws:secretsmanager:us-east-1:152915761077:secret:videoprocessor-app-2ppKl7"
}

locals {
  env = { for tuple in regexall("(.*)=(.*)", file(".env")) : tuple[0] => sensitive(tuple[1]) }
}