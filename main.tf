provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = "arn:aws:iam::774305598336:role/eks_cluster_role"

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

