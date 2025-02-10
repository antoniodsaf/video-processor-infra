data "aws_secretsmanager_secret_version" "videoprocessor_credentials" {
  secret_id = var.videoprocessor_credentials_arn
}
provider "kubernetes" {  
  host                   = data.aws_eks_cluster.eks-cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks-cluster.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
    command     = "aws"
  }
}

resource "kubernetes_secret" "videoprocessor_secret" {
  metadata {
    name = "videoprocessor-secret"
  }
  data = {
    DB_HOST = jsondecode(data.aws_secretsmanager_secret_version.videoprocessor_credentials.secret_string)["DATABASE_HOST"]
    DB_PORT = jsondecode(data.aws_secretsmanager_secret_version.videoprocessor_credentials.secret_string)["DATABASE_PORT"]
    DB_USER = jsondecode(data.aws_secretsmanager_secret_version.videoprocessor_credentials.secret_string)["DATABASE_USER"]
    DB_PASSWORD = jsondecode(data.aws_secretsmanager_secret_version.videoprocessor_credentials.secret_string)["DATABASE_PASS"]
    DB_NAME = jsondecode(data.aws_secretsmanager_secret_version.videoprocessor_credentials.secret_string)["DATABASE_NAME"]
    #AWS_ACCESS_KEY_ID = local.env["aws_access_key_id"]
    #AWS_SECRET_ACCESS_KEY = local.env["aws_secret_access_key"]
    #AWS_SESSION_TOKEN = local.env["aws_session_token"]
    AWS_REGION = var.region
  }
  type = "literals"
}

#{"DATABASE_HOST":"X","DATABASE_PORT":"x","DATABASE_PASS":"x","DATABASE_USER":"x","DATABASE_NAME":"x"}
