# ── Módulo RDS ────────────────────────────────────────────────────────────────
# Cria o PostgreSQL 16 gerenciado (RDS) em subnets privadas,
# acessível apenas pelos worker nodes do EKS (provisionado no repositório infra-kube).
module "rds" {
  source = "./modules/rds"

  project_name = var.project_name
  environment  = var.environment

  vpc_id             = data.terraform_remote_state.infra_kube.outputs.vpc_id
  private_subnet_ids = data.terraform_remote_state.infra_kube.outputs.private_subnet_ids
  eks_node_sg_id     = data.terraform_remote_state.infra_kube.outputs.node_security_group_id
  eks_cluster_sg_id  = data.terraform_remote_state.infra_kube.outputs.cluster_security_group_id

  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
  db_instance_class    = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_backup_retention  = var.db_backup_retention
}
