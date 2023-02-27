resource "google_storage_bucket" "datalake" {
  name                           = var.datalake_name
  location                       = var.datalake_region
  storage_class                  = var.datalake_storage_class
  uniform_bucket_level_access    = var.datalake_uniform_bucket_level_access
  public_access_prevention       = var.datalake_public_access_prevention

  lifecycle_rule {
    action {
      type                       = var.datalake_lifecycle_rule_action
    }
    condition {
      age                        = var.datalake_lifecycle_rule_condition_age_days
    }
  }
  force_destroy                  = var.datalake_force_destroy
}
