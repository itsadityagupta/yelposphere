output "project_id" {
  value = var.project_id
}
output "region" {
  value = var.region
}

output "datalake_url" {
  value = module.storage.datalake_url
}

output "bigquery_staging_dataset" {
  value = var.bigquery_staging_dataset_name
}
output "bigquery_staging_business_table" {
  value = var.bigquery_staging_business_table_name
}
output "bigquery_staging_checkin_table" {
  value = var.bigquery_staging_checkin_table_name
}
output "bigquery_staging_reviews_table" {
  value = var.bigquery_staging_reviews_table_name
}
output "bigquery_staging_tips_table" {
  value = var.bigquery_staging_tips_table_name
}
output "bigquery_staging_users_table" {
  value = var.bigquery_staging_users_table_name
}

output "dataproc_cluster_name" {
  value = var.dataproc_cluster_name
}
output "dataproc_temp_bucket" {
  value = var.dataproc_temp_bucket_name
}

output "ingest_business_data_script_uri" {
  value = module.storage.ingest_business_data_script_uri
}
output "ingest_checkin_data_script_uri" {
  value = module.storage.ingest_checkin_data_script_uri
}
output "ingest_reviews_data_script_uri" {
  value = module.storage.ingest_reviews_data_script_uri
}
output "ingest_tips_data_script_uri" {
  value = module.storage.ingest_tips_data_script_uri
}
output "ingest_users_data_uri" {
  value = module.storage.ingest_users_data_uri
}