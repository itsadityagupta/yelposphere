locals {
  dags_bucket_name = split("/", google_composer_environment.orchestrator.config[0].dag_gcs_prefix)[2]
}

variable "project_number" {
  type = string
}

variable "composer_env_name" {
  description = "Cloud Composer environment name"
  type        = string
}

variable "composer_region" {
  type = string
}

variable "compose_image_version" {
  type        = string
  description = "Cloud Composer Image Version."
}

variable "composer_service_account_email" {
  type = string
}

variable "composer_environment_size" {
  type = string
}

variable "scheduler_cpu" {
  type = number
}

variable "scheduler_memory_gb" {
  type = number
}

variable "scheduler_storage_gb" {
  type = number
}

variable "scheduler_count" {
  type = number
}

variable "webserver_cpu" {
  type = number
}

variable "webserver_memory_gb" {
  type = number
}

variable "webserver_storage_gb" {
  type = number
}

variable "worker_cpu" {
  type = number
}

variable "worker_memory_gb" {
  type = number
}

variable "worker_storage_gb" {
  type = number
}

variable "worker_min_count" {
  type = number
}

variable "worker_max_count" {
  type = number
}

variable "dags_file_path" {
  type = string
}