resource "google_project_service" "compute_api" {
  service = "compute.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "logging_api" {
  service = "logging.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "monitoring_api" {
  service = "monitoring.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "composer_api" {
  service = "composer.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "iam_api" {
  service = "iam.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "iam_credentials_api" {
  service = "iamcredentials.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "dataproc_api" {
  service = "dataproc.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "bigquery_api" {
  service = "bigquery.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "run_api" {
  service = "run.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "service_usage_api" {
  service = "serviceusage.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "kubernetes_api" {
  service = "container.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "secret_manager_api" {
  service = "secretmanager.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "artifact_registry_api" {
  service = "artifactregistry.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "resource_manager_api" {
  service = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false
}