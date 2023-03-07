variable "dataproc_staging_bucket_name" {
  type = string
}

variable "dataproc_staging_bucket_region" {
  type = string
}

variable "dataproc_staging_bucket_storage_class" {
  type = string
}

variable "dataproc_staging_bucket_uniform_bucket_level_access" {
  type = bool
}

variable "dataproc_staging_bucket_public_access_prevention" {
  type = string
}

variable "dataproc_staging_bucket_lifecycle_rule_action" {
  type = string
}

variable "dataproc_staging_bucket_lifecycle_rule_condition_age_days" {
  type = number
}

variable "dataproc_staging_bucket_force_destroy" {
  type = bool
}

variable "dataproc_temp_bucket_name" {
  type = string
}

variable "dataproc_temp_bucket_region" {
  type = string
}

variable "dataproc_temp_bucket_storage_class" {
  type = string
}

variable "dataproc_temp_bucket_uniform_bucket_level_access" {
  type = bool
}

variable "dataproc_temp_bucket_public_access_prevention" {
  type = string
}

variable "dataproc_temp_bucket_lifecycle_rule_action" {
  type = string
}

variable "dataproc_temp_bucket_lifecycle_rule_condition_age_days" {
  type = number
}

variable "dataproc_temp_bucket_force_destroy" {
  type = bool
}

variable "dataproc_cluster_name" {
  type = string
}

variable "dataproc_cluster_region" {
  type = string
}

variable "dataproc_graceful_decommission_timeout" {
  type = string
}

variable "dataproc_master_num_instances" {
  type = number
}

variable "dataproc_master_machine_type" {
  type = string
}

variable "dataproc_master_boot_disk_type" {
  type = string
}

variable "dataproc_master_boot_disk_size_gb" {
  type = number
}

variable "dataproc_worker_num_instances" {
  type = number
}

variable "dataproc_worker_machine_type" {
  type = string
}

variable "dataproc_worker_boot_disk_type" {
  type = string
}

variable "dataproc_worker_boot_disk_size_gb" {
  type = number
}

variable "dataproc_image_version" {
  type = string
}

variable "dataproc_allow_zero_workers" {
  type = string
}