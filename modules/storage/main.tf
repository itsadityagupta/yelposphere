resource "google_storage_bucket" "data_lake" {
  name          = var.datalake_name
  location      = var.region
  storage_class = var.storage_class
  uniform_bucket_level_access = true
  public_access_prevention = "enforced"

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30  // days
    }
  }

  force_destroy = true
}