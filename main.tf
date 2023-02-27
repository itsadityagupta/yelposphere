terraform {
  required_version = ">= 1.0"
  backend "local" {}
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

  dataproc_staging_bucket_name = var.dataproc_staging_bucket_name
  dataproc_temp_bucket_name = var.dataproc_temp_bucket_name

}

module "bigquery" {
  source = "./modules/bigquery"

  project = var.project
  region = var.region
  yelp_staging_dataset = var.yelp_staging_dataset
  business_staging_table = var.business_staging_table
}

module "dataproc" {
  source = "./modules/dataproc"

  region = var.region
  dataproc_staging_bucket_name = var.dataproc_staging_bucket_name
  dataproc_temp_bucket_name = var.dataproc_temp_bucket_name

  depends_on = [module.storage]
}

module "cloud_composer" {
  source = "./modules/composer"

  // environment config
  composer_env_name = var.composer_env_name
  composer_region = var.composer_region
  compose_image_version = var.compose_image_version
  composer_service-account = var.composer_service-account
  composer_environment_size = var.composer_environment_size

  // scheduler config
  scheduler_cpu = var.scheduler_cpu
  scheduler_memory_gb = var.scheduler_memory_gb
  scheduler_storage_gb = var.scheduler_memory_gb
  scheduler_count = var.scheduler_count

  // web server config
  webserver_cpu = var.webserver_cpu
  webserver_memory_gb = var.webserver_memory_gb
  webserver_storage_gb = var.webserver_storage_gb

  // worker config
  worker_cpu = var.worker_cpu
  worker_memory_gb = var.worker_memory_gb
  worker_storage_gb = var.worker_storage_gb
  worker_min_count = var.worker_min_count
  worker_max_count = var.worker_max_count
}