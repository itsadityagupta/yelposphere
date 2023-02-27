output "datalake_url" {
  value = module.storage.datalake_url
}

output "dataproc_staging_bucket_url" {
  value = module.storage.dataproc_staging_bucket_url
}

output "dataproc_temp_bucket" {
  value = module.storage.dataproc_temp_bucket_url
}

output "dataproc_cluster_name" {
  value = module.dataproc.dataproc_cluster_name
}

output "airflow_dags_folder_path" {
  value = module.composer.airflow_dags_folder_path
}