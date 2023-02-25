variable "project" {
  description = "Your GCP Project ID"
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

variable "yelp_staging_dataset" {
  description = "Dataset id to store raw tables."
  type = string
}

variable "business_staging_table" {
  description = "Staging table id to store businesses data"
  type = string
}