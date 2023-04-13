resource "google_storage_bucket" "datalake" {
  name                        = var.datalake_name
  location                    = var.datalake_region
  storage_class               = var.datalake_storage_class
  uniform_bucket_level_access = var.datalake_uniform_bucket_level_access
  public_access_prevention    = var.datalake_public_access_prevention

  lifecycle_rule {
    action {
      type = var.datalake_lifecycle_rule_action
    }
    condition {
      age = var.datalake_lifecycle_rule_condition_age_days
    }
  }
  force_destroy = var.datalake_force_destroy
}

resource "google_storage_bucket_object" "ingest_businesses_data" {
  bucket = google_storage_bucket.datalake.name
  name   = "scripts/ingest_businesses_data.py"
  source = var.ingest_business_data_script_path

  depends_on = [google_storage_bucket.datalake]
}

resource "google_storage_bucket_object" "ingest_checkin_data" {
  bucket = google_storage_bucket.datalake.name
  name   = "scripts/ingest_checkin_data.py"
  source = var.ingest_checkin_data_script_path

  depends_on = [google_storage_bucket.datalake]
}

resource "google_storage_bucket_object" "ingest_reviews_data" {
  bucket = google_storage_bucket.datalake.name
  name   = "scripts/ingest_reviews_data.py"
  source = var.ingest_reviews_data_script_path

  depends_on = [google_storage_bucket.datalake]
}

resource "google_storage_bucket_object" "ingest_tips_data" {
  bucket = google_storage_bucket.datalake.name
  name   = "scripts/ingest_tips_data.py"
  source = var.ingest_tips_data_script_path

  depends_on = [google_storage_bucket.datalake]
}

resource "google_storage_bucket_object" "ingest_users_data" {
  bucket = google_storage_bucket.datalake.name
  name   = "scripts/ingest_users_data.py"
  source = var.ingest_users_data_script_path

  depends_on = [google_storage_bucket.datalake]
}
