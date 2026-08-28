# ── Projeto ───────────────────────────────────────────────────────────────────

variable "project_name" {
  description = "Nome do projeto — prefixo de todos os recursos AWS"
  type        = string
  default     = "oficina-mecanica"
}

variable "aws_region" {
  description = "Região AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Ambiente de deployment: dev | staging | prod"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "O valor deve ser dev, staging ou prod."
  }
}

variable "tf_state_bucket" {
  description = "Bucket S3 onde o state do repositório infra-kube está armazenado (mesmo bucket usado pelo backend deste repositório)."
  type        = string
}

# ── RDS ───────────────────────────────────────────────────────────────────────

variable "db_name" {
  description = "Nome do banco de dados PostgreSQL"
  type        = string
  default     = "oficina"
}

variable "db_username" {
  description = "Usuário administrador do RDS"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Senha do RDS. Use TF_VAR_db_password ou terraform.tfvars (nunca commitar)"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Classe de instância RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Armazenamento inicial em GB"
  type        = number
  default     = 20
}

variable "db_backup_retention" {
  description = "Dias de retenção de backup do RDS (0 = desabilitado)"
  type        = number
  default     = 0
}
