project_id = "dtc-de-zoomcamp-2023" // TODO
region = "asia-south1" // TODO

# Change credentials to point to your service account JSON file (if not using GOOGLE_APPLICATION_CREDENTIALS environment variable)
credentials = ""

# GCS Configurations
datalake_name = "dezoomcamp2023_capstone_project_datalake" // TODO
datalake_region = "asia-south1" // TODO
datalake_storage_class = "STANDARD"
datalake_uniform_bucket_level_access = true
datalake_public_access_prevention = "enforced"
datalake_lifecycle_rule_action = "Delete"
datalake_lifecycle_rule_condition_age_days = 30
datalake_force_destroy = true

# BigQuery Configurations
bigquery_staging_dataset_name = "staging" // TODO
bigquery_staging_dataset_description = "Stores staging tables for yelp."
bigquery_staging_dataset_region = "asia-south1" // TODO
bigquery_staging_dataset_delete_contents_on_destroy = true

bigquery_staging_business_table_name = "stg_businesses" // TODO
bigquery_staging_business_table_description = "Staging businesses table"
bigquery_staging_business_table_deletion_protection = false
bigquery_staging_business_table_schema_filepath = "modules/bigquery/schemas/businesses.json"

# Dataproc Configurations

dataproc_cluster_name = "yelp-preprocess" // TODO
dataproc_cluster_region = "asia-south1" // TODO
dataproc_graceful_decommission_timeout = "120s"
dataproc_master_num_instances = 1
dataproc_master_machine_type = "e2-standard-2"
dataproc_master_boot_disk_type = "pd-standard"
dataproc_master_boot_disk_size_gb = 30
dataproc_image_version = "2.1.4-ubuntu20"
dataproc_allow_zero_workers = "true"

dataproc_staging_bucket_name = "zoomcampdataprocstagingbucket2023" // TODO
dataproc_staging_bucket_region = "asia-south1" // TODO
dataproc_staging_bucket_storage_class = "STANDARD"
dataproc_staging_bucket_uniform_bucket_level_access = true
dataproc_staging_bucket_public_access_prevention = "enforced"
dataproc_staging_bucket_lifecycle_rule_action = "Delete"
dataproc_staging_bucket_lifecycle_rule_condition_age_days = 30
dataproc_staging_bucket_force_destroy = true

dataproc_temp_bucket_name = "zoomcampdataproctempbucket2023" // TODO
dataproc_temp_bucket_region = "asia-south1" // TODO
dataproc_temp_bucket_storage_class = "STANDARD"
dataproc_temp_bucket_uniform_bucket_level_access = true
dataproc_temp_bucket_public_access_prevention = "enforced"
dataproc_temp_bucket_lifecycle_rule_action = "Delete"
dataproc_temp_bucket_lifecycle_rule_condition_age_days = 30
dataproc_temp_bucket_force_destroy = true

# Cloud Composer Configuration
composer_env_name = "yelp-orchestrator" // TODO
composer_region = "asia-south1" // TODO
compose_image_version = "composer-2-airflow-2"
composer_service_account_email = "dezoomcamp-capstone-project@dtc-de-zoomcamp-2023.iam.gserviceaccount.com" // TODO
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