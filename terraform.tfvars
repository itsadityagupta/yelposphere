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
