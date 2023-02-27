output "datalake_url" {
  value = google_storage_bucket.data_lake.url
}

output "dataproc_staging_bucket_url" {
  value = google_storage_bucket.dataproc_staging_bucket.url
}

output "dataproc_temp_bucket_url" {
  value = google_storage_bucket.dataproc_temp_bucket.url
}