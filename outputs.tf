output "datalake_url" {
  value = module.storage.datalake_url
}

output "dataproc_staging_bucket_url" {
  value = module.storage.dataproc_staging_bucket_url
}

output "dataproc_temp_bucket" {
  value = module.storage.dataproc_temp_bucket_url
}

output "yelp_staging_dataset" {
  value = module.bigquery.yelp_staging_dataset
}

output "staging_business_table" {
  value = module.bigquery.staging_business_table
}

output "dataproc_cluster_name" {
  value = module.dataproc.dataproc_cluster_name
}