project_id     = "dtc-de-zoomcamp-2023" // TODO
project_number = "168078315494"
region         = "asia-south1" // TODO

# Change credentials to point to your service account JSON file (if not using GOOGLE_APPLICATION_CREDENTIALS environment variable)
credentials = ""

# GCS Configurations
datalake_name                              = "dezoomcamp2023_capstone_project_datalake" // TODO
datalake_region                            = "asia-south1"                              // TODO
datalake_storage_class                     = "STANDARD"
datalake_uniform_bucket_level_access       = true
datalake_public_access_prevention          = "enforced"
datalake_lifecycle_rule_action             = "Delete"
datalake_lifecycle_rule_condition_age_days = 30
datalake_force_destroy                     = true
datalake_copy_data_from_bucket             = "gcs_capstone_dezoomcamp"
ingest_business_data_script_path           = "../spark_jobs/ingest_businesses_data.py"
ingest_checkin_data_script_path            = "../spark_jobs/ingest_checkin_data.py"
ingest_reviews_data_script_path            = "../spark_jobs/ingest_reviews_data.py"
ingest_tips_data_script_path               = "../spark_jobs/ingest_tips_data.py"
ingest_users_data_script_path              = "../spark_jobs/ingest_users_data.py"

# BigQuery Configurations
bigquery_staging_dataset_name                       = "staging" // TODO
bigquery_staging_dataset_description                = "Stores staging tables for yelp."
bigquery_staging_dataset_region                     = "asia-south1" // TODO
bigquery_staging_dataset_delete_contents_on_destroy = true

bigquery_dbt_dataset_name                       = "yelp_dbt"
bigquery_dbt_dataset_description                = "Stores dbt models"
bigquery_dbt_dataset_region                     = "asia-south1"
bigquery_dbt_dataset_delete_contents_on_destroy = true

bigquery_staging_business_table_name                = "stg_businesses" // TODO
bigquery_staging_business_table_description         = "Staging businesses table"
bigquery_staging_business_table_deletion_protection = false
bigquery_staging_business_table_schema_filepath     = "modules/bigquery/schemas/businesses.json"
bigquery_staging_business_table_partition_column    = "is_open"

bigquery_staging_checkin_table_name                = "stg_checkin"
bigquery_staging_checkin_table_description         = "Staging checkins table"
bigquery_staging_checkin_table_deletion_protection = false
bigquery_staging_checkin_table_schema_filepath     = "modules/bigquery/schemas/checkins.json"

bigquery_staging_reviews_table_name                = "stg_reviews"
bigquery_staging_reviews_table_description         = "Reviews staging table"
bigquery_staging_reviews_table_deletion_protection = false
bigquery_staging_reviews_table_schema_filepath     = "modules/bigquery/schemas/reviews.json"

bigquery_staging_tips_table_name                = "stg_tips"
bigquery_staging_tips_table_description         = "Tips staging table"
bigquery_staging_tips_table_deletion_protection = false
bigquery_staging_tips_table_schema_filepath     = "modules/bigquery/schemas/tips.json"

bigquery_staging_users_table_name                = "stg_users"
bigquery_staging_users_table_description         = "Users staging table"
bigquery_staging_users_table_deletion_protection = false
bigquery_staging_users_table_schema_filepath     = "modules/bigquery/schemas/users.json"

# Dataproc Configurations

dataproc_cluster_name                  = "yelp-preprocess-prod" // TODO
dataproc_cluster_region                = "asia-south1"          // TODO
dataproc_graceful_decommission_timeout = "120s"
dataproc_master_num_instances          = 1
dataproc_master_machine_type           = "e2-standard-2"
dataproc_master_boot_disk_type         = "pd-standard"
dataproc_master_boot_disk_size_gb      = 30
dataproc_worker_num_instances          = 2
dataproc_worker_machine_type           = "e2-standard-2"
dataproc_worker_boot_disk_type         = "pd-standard"
dataproc_worker_boot_disk_size_gb      = 30
dataproc_image_version                 = "2.1.4-ubuntu20"
dataproc_allow_zero_workers            = "true"

dataproc_staging_bucket_name                              = "zoomcampdataprocstagingbucket2023" // TODO
dataproc_staging_bucket_region                            = "asia-south1"                       // TODO
dataproc_staging_bucket_storage_class                     = "STANDARD"
dataproc_staging_bucket_uniform_bucket_level_access       = true
dataproc_staging_bucket_public_access_prevention          = "enforced"
dataproc_staging_bucket_lifecycle_rule_action             = "Delete"
dataproc_staging_bucket_lifecycle_rule_condition_age_days = 30
dataproc_staging_bucket_force_destroy                     = true

dataproc_temp_bucket_name                              = "zoomcampdataproctempbucket2023" // TODO
dataproc_temp_bucket_region                            = "asia-south1"                    // TODO
dataproc_temp_bucket_storage_class                     = "STANDARD"
dataproc_temp_bucket_uniform_bucket_level_access       = true
dataproc_temp_bucket_public_access_prevention          = "enforced"
dataproc_temp_bucket_lifecycle_rule_action             = "Delete"
dataproc_temp_bucket_lifecycle_rule_condition_age_days = 30
dataproc_temp_bucket_force_destroy                     = true

# Cloud Composer Configuration
composer_env_name              = "dataproc-yelp" // TODO
composer_region                = "asia-south1"       // TODO
compose_image_version          = "composer-2-airflow-2"
composer_service_account_email = "dezoomcamp-capstone-project@dtc-de-zoomcamp-2023.iam.gserviceaccount.com" // TODO
composer_environment_size      = "ENVIRONMENT_SIZE_MEDIUM"
scheduler_cpu                  = 2
scheduler_memory_gb            = 7.5
scheduler_storage_gb           = 5
scheduler_count                = 2
webserver_cpu                  = 2
webserver_memory_gb            = 7.5
webserver_storage_gb           = 5
worker_cpu                     = 2
worker_memory_gb               = 7.5
worker_storage_gb              = 5
worker_min_count               = 2
worker_max_count               = 6
dags_file_path                 = "../cloud_composer/ingest_data_dags.py"