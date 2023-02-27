variable "project_id" {
  description = "Your GCP Project ID."
  type = string
}

variable "region" {
  description = "Region for GCP resources."
  type = string
}

variable "credentials" {
  description = "Path to the key file for service account."
  type = string
}

variable "datalake_name" {
  description = "Name of the GCS bucket used as a data lake for this project."
  type = string
}

variable "datalake_storage_class" {
  description = "Storage class type for your bucket. Check official docs for more info."
  type = string
}

variable "dataproc_staging_bucket_name" {
  type = string
}

variable "dataproc_temp_bucket_name" {
  type = string
}

// staging dataset configurations

variable "bigquery_staging_dataset_name" {
  description = "Dataset name to store raw tables."
  type = string
}

variable "bigquery_staging_dataset_description" {
  description = "Description for a BigQuery dataset."
  type = string
}

variable "bigquery_staging_dataset_region" {
  description = "Region for BigQuery datasets."
  type = string
}

variable "bigquery_staging_dataset_delete_contents_on_destroy" {
  description = "Delete contents on destroy for BigQuery staging dataset."
  type = bool
}

// business staging table configurations

variable "bigquery_staging_business_table_name" {
  description = "Staging table name to store business data."
  type = string
}

variable "bigquery_staging_business_table_description" {
  description = "Description of the business staging table."
  type = string
}

variable "bigquery_staging_business_table_deletion_protection" {
  description = "Deletion protection for business staging table."
  type = bool
}

variable "bigquery_staging_business_table_schema_filepath" {
  description = "Table schema file path foe business staging table."
  type = string
}

variable "composer_env_name" {
  description = "Cloud Composer environment name"
  type = string
}

variable "composer_region" {
  type = string
}

variable "compose_image_version" {
  type = string
  description = "Cloud Composer Image Version."
}

variable "composer_service-account" {
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