variable "project" {
  description = "Your GCP Project ID"
  type = string
}

variable "region" {
  description = "Region for GCP resources."
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