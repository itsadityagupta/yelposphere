locals {
  bigquery_staging_business_table_schema = file(var.bigquery_staging_business_table_schema_filepath)
}

variable "project_id" {
  description = "Your GCP Project ID."
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
