output "yelp_staging_dataset" {
  value = google_bigquery_dataset.yelp_staging.dataset_id
}

output "staging_business_table" {
  value = google_bigquery_table.stg_businesses.table_id
}