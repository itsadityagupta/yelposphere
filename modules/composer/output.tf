output "airflow_dags_folder_path" {
  value = google_composer_environment.orchestrator.config[0].dag_gcs_prefix
}