variable "team_name" {}

variable "db_allocated_storage" {
  description = "The allocated storage in gibibytes"
  default     = 10
}

variable "db_engine" {
  description = "Database engine used e.g. postgres, mqsql"
  default     = "postgres"
}

variable "db_engine_version" {
  description = "The engine version to use e.g. 10.4"
  default     = 10.4
}

variable "db_instance_class" {
  description = "The instance type of the RDS instance"
  default     = "db.t2.small"
}

variable "db_backup_retention_period" {
  description = "The days to retain backups. Must be 1 or greater to be a source for a Read Replica"
}

variable "db_storage_type" {
  description = "One of standard magnetic gp2 general purpose SSD or io1 provisioned IOPS SSD."
  default     = "gp2"
}

variable "db_iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of io1"
  default     = 0
}

variable "db_name" {
  description = "The name of the database to be created on the instance (if empty, it will be the generated random identifier)"
  default     = ""
}

variable "business-unit" {
  description = " Area of the MOJ responsible for the service"
  default     = "mojdigital"
}

variable "application" {}

variable "is-production" {
  default = "false"
}

variable "environment-name" {}

variable "infrastructure-support" {
  description = "The team responsible for managing the infrastructure. Should be of the form <team-name> (<team-email>)"
}

variable "cluster_name" {
  description = "The name of the cluster (eg.: cloud-platform-live-0)"
}

variable "cluster_state_bucket" {
  description = "The name of the S3 bucket holding the terraform state for the cluster"
}
