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