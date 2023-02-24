terraform {
  required_version = ">= 1.0"
  backend "local" {}  # Can change from "local" to "gcs" (for google) or "s3" (for aws), if you would like to preserve your tf-state online
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  project = var.project
  region = var.region
  // credentials = file(var.credentials)  # Use this if you do not want to set env-var GOOGLE_APPLICATION_CREDENTIALS
}

module "storage" {
  source = "./modules/storage"

  region = var.region
  datalake_name = var.datalake_name
  storage_class = var.datalake_storage_class

}

module "bigquery" {
  source = "./modules/bigquery"

  project = var.project
  region = var.region
  yelp_staging_dataset = var.yelp_staging_dataset
  business_staging_table = var.business_staging_table
}