resource "google_project_service" "iam" {
  service = "iam.googleapis.com"
}

resource "google_project_service" "iamcredentials" {
  service = "iamcredentials.googleapis.com"
}

resource "google_project_service" "storage" {
  service = "storage.googleapis.com"
}

resource "google_project_service" "storage-component" {
  service = "storage-component.googleapis.com"
}

resource "google_project_service" "storagetransfer" {
  service = "storagetransfer.googleapis.com"
}

resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "composer" {
  service = "composer.googleapis.com"
}

resource "google_project_service" "dataproc" {
  service = "dataproc.googleapis.com"
}

resource "google_project_service" "bigquery" {
  service = "bigquery.googleapis.com"
}

resource "google_project_service" "bigqueryconnection" {
  service = "bigqueryconnection.googleapis.com"
}

resource "google_project_service" "bigquerystorage" {
  service = "bigquerystorage.googleapis.com"
}
