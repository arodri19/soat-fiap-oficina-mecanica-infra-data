output "db_endpoint" {
  description = "Endpoint do RDS PostgreSQL (host:porta)"
  value       = module.rds.db_endpoint
}

output "db_host" {
  description = "Hostname do RDS (sem porta)"
  value       = module.rds.db_host
}

output "db_port" {
  description = "Porta do PostgreSQL"
  value       = module.rds.db_port
}

output "rds_security_group_id" {
  description = "Security group do RDS. Consumido pelo repositório serverless para liberar acesso da Lambda de autenticação."
  value       = module.rds.rds_security_group_id
}

output "db_connection_string" {
  description = "DATABASE_URL completa para uso na aplicação"
  value       = "postgresql://${var.db_username}:${var.db_password}@${module.rds.db_endpoint}/${var.db_name}?schema=public"
  sensitive   = true
}

output "db_secret_patch_command" {
  description = "Comando para atualizar o Secret do Kubernetes com o endpoint RDS real (executar no repositório da aplicação principal)"
  value       = "kubectl patch secret oficina-secrets -n oficina-mecanica -p '{\"stringData\":{\"DATABASE_URL\":\"postgresql://${var.db_username}:<SENHA>@${module.rds.db_endpoint}/${var.db_name}?schema=public\"}}'"
}
