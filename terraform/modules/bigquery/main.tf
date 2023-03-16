resource "google_bigquery_dataset" "staging_dataset" {
  dataset_id  = var.bigquery_staging_dataset_name
  project     = var.project_id
  location    = var.bigquery_staging_dataset_region
  description = var.bigquery_staging_dataset_description

  delete_contents_on_destroy = var.bigquery_staging_dataset_delete_contents_on_destroy
}
resource "google_bigquery_dataset" "dbt_dataset" {
  dataset_id  = var.bigquery_dbt_dataset_name
  project     = var.project_id
  location    = var.bigquery_dbt_dataset_region
  description = var.bigquery_dbt_dataset_description

  delete_contents_on_destroy = var.bigquery_dbt_dataset_delete_contents_on_destroy
}
resource "google_bigquery_table" "business_staging_table" {
  dataset_id          = google_bigquery_dataset.staging_dataset.dataset_id
  table_id            = var.bigquery_staging_business_table_name
  description         = var.bigquery_staging_business_table_description
  deletion_protection = var.bigquery_staging_reviews_table_deletion_protection
  schema              = local.bigquery_staging_business_table_schema

  range_partitioning {
    field = var.bigquery_staging_business_table_partition_column
    range {
      end      = 2
      interval = 1
      start    = 0
    }
  }

  depends_on = [google_bigquery_dataset.staging_dataset]
}
resource "google_bigquery_table" "checkin_staging_table" {
  dataset_id          = google_bigquery_dataset.staging_dataset.dataset_id
  table_id            = var.bigquery_staging_checkin_table_name
  description         = var.bigquery_staging_checkin_table_description
  deletion_protection = var.bigquery_staging_checkin_table_deletion_protection

  schema     = local.bigquery_staging_checkin_table_schema
  depends_on = [google_bigquery_dataset.staging_dataset]
}
resource "google_bigquery_table" "reviews_staging_table" {
  dataset_id          = google_bigquery_dataset.staging_dataset.dataset_id
  table_id            = var.bigquery_staging_reviews_table_name
  description         = var.bigquery_staging_reviews_table_description
  deletion_protection = var.bigquery_staging_reviews_table_deletion_protection

  schema     = local.bigquery_staging_reviews_table_schema
  depends_on = [google_bigquery_dataset.staging_dataset]
}
resource "google_bigquery_table" "tips_staging_table" {
  dataset_id          = google_bigquery_dataset.staging_dataset.dataset_id
  table_id            = var.bigquery_staging_tips_table_name
  description         = var.bigquery_staging_tips_table_description
  deletion_protection = var.bigquery_staging_tips_table_deletion_protection

  schema     = local.bigquery_staging_tips_table_schema
  depends_on = [google_bigquery_dataset.staging_dataset]
}
resource "google_bigquery_table" "users_staging_table" {
  dataset_id          = google_bigquery_dataset.staging_dataset.dataset_id
  table_id            = var.bigquery_staging_users_table_name
  description         = var.bigquery_staging_users_table_description
  deletion_protection = var.bigquery_staging_users_table_deletion_protection

  schema     = local.bigquery_staging_users_table_schema
  depends_on = [google_bigquery_table.users_staging_table]
}
