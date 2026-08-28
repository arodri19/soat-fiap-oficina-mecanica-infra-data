# Lê os outputs do repositório soat-fiap-oficina-mecanica-infra-kube (VPC + EKS)
# para liberar o acesso do RDS aos worker nodes, sem duplicar o provisionamento da rede.
data "terraform_remote_state" "infra_kube" {
  backend = "s3"

  config = {
    bucket = var.tf_state_bucket
    key    = "oficina-mecanica/infra-kube/terraform.tfstate"
    region = var.aws_region
  }
}
