project = "dtc-de-zoomcamp-2023"
region = "asia-south2"

# Change credentials to point to your service account JSON file (if not using GOOGLE_APPLICATION_CREDENTIALS environment variable)
credentials = "dezoomcamp-capstone-project-key.json"

# GCS Configurations
datalake_storage_class = "STANDARD"
datalake_name = "dezoomcamp2023_capstone_project_datalake"
dataproc_staging_bucket_name = "zoomcampdataprocstagingbucket2023"
dataproc_temp_bucket_name = "zoomcampdataproctempbucket2023"

# BigQuery Configuration
yelp_staging_dataset = "staging"
business_staging_table = "stg_businesses"

# Cloud Composer Configuration
composer_env_name = "yelp_orchestrator"
composer_region = "asia-south1"
compose_image_version = "composer-2-airflow-2"
composer_service-account = "dezoomcamp-capstone-project@dtc-de-zoomcamp-2023.iam.gserviceaccount.com"
composer_environment_size = "ENVIRONMENT_SIZE_SMALL"
scheduler_cpu = 0.5
scheduler_memory_gb = 1.875
scheduler_storage_gb = 1
scheduler_count = 1
webserver_cpu = 0.5
webserver_memory_gb = 1.875
webserver_storage_gb = 1
worker_cpu = 0.5
worker_memory_gb = 1.875
worker_storage_gb = 1
worker_min_count = 1
worker_max_count = 3