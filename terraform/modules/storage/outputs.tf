output "ingest_business_data_script_uri" {
  value = google_storage_bucket_object.ingest_businesses_data.output_name
}

output "ingest_checkin_data_script_uri" {
  value = google_storage_bucket_object.ingest_checkin_data.output_name
}

output "ingest_reviews_data_script_uri" {
  value = google_storage_bucket_object.ingest_reviews_data.output_name
}

output "ingest_tips_data_script_uri" {
  value = google_storage_bucket_object.ingest_tips_data.output_name
}

output "ingest_users_data_uri" {
  value = google_storage_bucket_object.ingest_users_data.output_name
}

output "datalake_url" {
  value = google_storage_bucket.datalake.url
}