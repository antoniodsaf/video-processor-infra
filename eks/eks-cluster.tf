data "aws_eks_cluster" "eks-cluster" {
  depends_on = [aws_eks_cluster.eks-cluster]
  name = var.cluster_name
}

resource "aws_eks_cluster" "eks-cluster" {
  name     = var.cluster_name
  role_arn = var.lab_role

  vpc_config {
    subnet_ids         = [for subnet in data.aws_subnet.subnet : subnet.id if subnet.availability_zone != "${var.region}e"]
    security_group_ids = [aws_security_group.sg.id]
  }

  access_config {
    authentication_mode = var.access_config
  }
}