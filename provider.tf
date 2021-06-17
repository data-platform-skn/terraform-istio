provider "aws" {
  region = var.region
}

provider "helm" {
  kubernetes {
  host                   = data.aws_eks_cluster.default.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.default.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.default.token
  }
}

data "aws_eks_cluster" "default" {
  name = "devops-catalog"
}

data "aws_eks_cluster_auth" "default" {
  name = "devops-catalog"
}
