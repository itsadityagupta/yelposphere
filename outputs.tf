output "datalake_url" {
  value = module.storage.datalake_url
}

output "yelp_staging_dataset" {
  value = module.bigquery.yelp_staging_dataset
}

output "staging_business_table" {
  value = module.bigquery.staging_business_table
}

output "airflow_dags_folder_path" {
  value = module.cloud_composer.airflow_dags_folder_path
}