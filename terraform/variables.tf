variable "project_id" {
  description = "Your GCP Project ID."
  type        = string
}

variable "region" {
  description = "Region for GCP resources."
  type        = string
}

variable "credentials" {
  description = "Path to the key file for service account."
  type        = string
}

// GCS Configurations

variable "datalake_name" {
  description = "Name of the GCS bucket used as a data lake for this project."
  type        = string
}

variable "datalake_region" {
  description = "Region for the data lake."
  type        = string
}

variable "datalake_storage_class" {
  description = "Storage class type for your bucket. Check official docs for more info."
  type        = string
}

variable "datalake_uniform_bucket_level_access" {
  description = "Enable uniform bucket level access in data lake."
  type        = bool
}

variable "datalake_public_access_prevention" {
  description = "Public access prevention for the datalake."
  type        = string
}

variable "datalake_lifecycle_rule_action" {
  description = "Action for life cycle rule in data lake."
  type        = string
}

variable "datalake_lifecycle_rule_condition_age_days" {
  description = "Age in days for life cycle rule in data lake."
  type        = number
}

variable "datalake_force_destroy" {
  description = "Enable force destroy for data lake."
  type        = bool
}

// Dataproc Configurations

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

variable "dataproc_image_version" {
  type = string
}

variable "dataproc_allow_zero_workers" {
  type = string
}

// staging dataset configurations

variable "bigquery_staging_dataset_name" {
  description = "Dataset name to store raw tables."
  type        = string
}

variable "bigquery_staging_dataset_description" {
  description = "Description for a BigQuery dataset."
  type        = string
}

variable "bigquery_staging_dataset_region" {
  description = "Region for BigQuery datasets."
  type        = string
}

variable "bigquery_staging_dataset_delete_contents_on_destroy" {
  description = "Delete contents on destroy for BigQuery staging dataset."
  type        = bool
}

// business staging table configurations

variable "bigquery_staging_business_table_name" {
  description = "Staging table name to store business data."
  type        = string
}

variable "bigquery_staging_business_table_description" {
  description = "Description of the business staging table."
  type        = string
}

variable "bigquery_staging_business_table_deletion_protection" {
  description = "Deletion protection for business staging table."
  type        = bool
}

variable "bigquery_staging_business_table_schema_filepath" {
  description = "Table schema file path foe business staging table."
  type        = string
}

variable "bigquery_staging_business_table_partition_column" {
  description = "Partition column for staging business table"
  type        = string
}

// checkin staging table configuration

variable "bigquery_staging_checkin_table_name" {
  description = "Staging table name to store business data."
  type        = string
}

variable "bigquery_staging_checkin_table_description" {
  description = "Description of the business staging table."
  type        = string
}

variable "bigquery_staging_checkin_table_deletion_protection" {
  description = "Deletion protection for business staging table."
  type        = bool
}

variable "bigquery_staging_checkin_table_schema_filepath" {
  description = "Table schema file path foe business staging table."
  type        = string
}

// reviews staging table configuration

variable "bigquery_staging_reviews_table_name" {
  description = "Staging table name to store business data."
  type        = string
}

variable "bigquery_staging_reviews_table_description" {
  description = "Description of the business staging table."
  type        = string
}

variable "bigquery_staging_reviews_table_deletion_protection" {
  description = "Deletion protection for business staging table."
  type        = bool
}

variable "bigquery_staging_reviews_table_schema_filepath" {
  description = "Table schema file path foe business staging table."
  type        = string
}

// tips staging table configuration

variable "bigquery_staging_tips_table_name" {
  description = "Staging table name to store business data."
  type        = string
}

variable "bigquery_staging_tips_table_description" {
  description = "Description of the business staging table."
  type        = string
}

variable "bigquery_staging_tips_table_deletion_protection" {
  description = "Deletion protection for business staging table."
  type        = bool
}

variable "bigquery_staging_tips_table_schema_filepath" {
  description = "Table schema file path foe business staging table."
  type        = string
}

// users staging table configurations

variable "bigquery_staging_users_table_name" {
  description = "Staging table name to store business data."
  type        = string
}

variable "bigquery_staging_users_table_description" {
  description = "Description of the business staging table."
  type        = string
}

variable "bigquery_staging_users_table_deletion_protection" {
  description = "Deletion protection for business staging table."
  type        = bool
}

variable "bigquery_staging_users_table_schema_filepath" {
  description = "Table schema file path foe business staging table."
  type        = string
}

// Composer environment name

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