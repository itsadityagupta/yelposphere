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

data "google_storage_transfer_project_service_account" "default" {
}

resource "google_storage_bucket_iam_member" "object_viewer" {
  bucket = var.datalake_copy_data_from_bucket
  member = "serviceAccount:${data.google_storage_transfer_project_service_account.default.email}"
  role   = "roles/storage.objectViewer"
}

resource "google_storage_bucket_iam_member" "legacy_bucket_reader" {
  bucket = var.datalake_copy_data_from_bucket
  member = "serviceAccount:${data.google_storage_transfer_project_service_account.default.email}"
  role   = "roles/storage.legacyBucketReader"
}

resource "google_storage_bucket_iam_member" "legacy_bucket_writer" {
  bucket = google_storage_bucket.datalake.name
  member = "serviceAccount:${data.google_storage_transfer_project_service_account.default.email}"
  role   = "roles/storage.legacyBucketWriter"
}

resource "google_storage_transfer_job" "ingest" {
  description = "Ingest raw data"

  transfer_spec {
    gcs_data_source {
      bucket_name = var.datalake_copy_data_from_bucket
    }
    gcs_data_sink {
      bucket_name = google_storage_bucket.datalake.name
      path        = "data/raw/"
    }
    transfer_options {
      delete_objects_from_source_after_transfer  = false
      overwrite_objects_already_existing_in_sink = true
    }
  }

  schedule {
    repeat_interval = null
    schedule_start_date {
      day   = 5
      month = 3
      year  = 2023
    }
    schedule_end_date {
      day   = 5
      month = 3
      year  = 2023
    }
  }

  depends_on = [
    google_storage_bucket.datalake,
    google_storage_bucket_iam_member.object_viewer,
    google_storage_bucket_iam_member.legacy_bucket_reader,
    google_storage_bucket_iam_member.legacy_bucket_writer
  ]

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
