resource "google_composer_environment" "orchestrator" {
  name   = var.composer_env_name
  region = var.composer_region

  config {
    software_config {
      image_version = var.compose_image_version
    }

    node_config {
      service_account = var.composer_service_account_email
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

    environment_size = var.composer_environment_size //"ENVIRONMENT_SIZE_SMALL" // TODO: Make it medium
  }
}

resource "google_storage_bucket_object" "upload_dag" {
  bucket = local.dags_bucket_name
  name   = "dags/ingest_data_dags.py"
  source = var.dags_file_path

  depends_on = [google_composer_environment.orchestrator]
}