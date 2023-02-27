resource "google_bigquery_dataset" "staging_dataset" {
  dataset_id = var.bigquery_staging_dataset_name
  project = var.project_id
  location = var.bigquery_staging_dataset_region
  description = var.bigquery_staging_dataset_description

  delete_contents_on_destroy = var.bigquery_staging_dataset_delete_contents_on_destroy
}

resource "google_bigquery_table" "business_staging_business_table" {
  dataset_id = google_bigquery_dataset.staging_dataset.dataset_id
  table_id   = var.bigquery_staging_business_table_name
  description = var.bigquery_staging_business_table_description
  deletion_protection = var.bigquery_staging_business_table_deletion_protection

  schema = local.bigquery_staging_business_table_schema

  range_partitioning {
    field = "is_open"
    range {
      start = 0
      end = 2
      interval = 1
    }
  }

  depends_on = [google_bigquery_dataset.staging_dataset]
}