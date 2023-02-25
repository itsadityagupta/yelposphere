variable "datalake_name" {
  type = string
}

variable "dataproc_staging_bucket_name" {
  type = string
}

variable "dataproc_temp_bucket_name" {
  type = string
}

variable "storage_class" {
  description = "Storage class type for your bucket. Check official docs for more info."
}

variable "region" {
  description = "Region for GCP resources."
  type = string
}