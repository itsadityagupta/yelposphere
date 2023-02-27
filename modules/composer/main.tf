#resource "google_service_account_iam_member" "composer_service_account" {
#  service_account_id = "dezoomcamp-capstone-project@dtc-de-zoomcamp-2023.iam.gserviceaccount.com"
#  role = "roles/composer.ServiceAgentV2Ext"
#  member = "serviceAccount:service-168078315494@cloudcomposer-accounts.iam.gserviceaccount.com"
#}

resource "google_composer_environment" "orchestrator" {
  name = var.composer_env_name
  region = var.composer_region

  config {
    software_config {
      image_version = var.compose_image_version
#      pypi_packages = {
#        dbt-bigquery = ""
#      }
      env_variables = {
        FOO = "bar" // TODO: Add if required
      }
    }

    node_config {
      service_account = var.composer_service-account
    }

    workloads_config {
      scheduler {
        cpu        = var.scheduler_cpu
        memory_gb  = var.scheduler_memory_gb
        storage_gb = var.scheduler_storage_gb
        count      = var.scheduler_count
      }
      web_server {
        cpu        = var.webserver_cpu
        memory_gb  = var.webserver_memory_gb
        storage_gb = var.webserver_storage_gb
      }
      worker {
        cpu        = var.worker_cpu
        memory_gb  = var.worker_memory_gb
        storage_gb = var.worker_storage_gb
        min_count  = var.worker_min_count
        max_count  = var.worker_max_count
      }
    }

    environment_size = "ENVIRONMENT_SIZE_SMALL" // TODO: Make it medium
  }
}
