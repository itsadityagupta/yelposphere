variable "datalake_name" {
  type = string
}

variable "datalake_region" {
  description = "Region for the data lake."
  type        = string
}

variable "datalake_storage_class" {
  description = "Storage class type for your bucket. Check official docs for more info."
  type        = string
}

variable "datalake_uniform_bucket_level_access" {
  description = "Enable uniform bucket level access in data lake."
  type        = bool
}

variable "datalake_public_access_prevention" {
  description = "Public access prevention for the datalake."
  type        = string
}

variable "datalake_lifecycle_rule_action" {
  description = "Action for life cycle rule in data lake."
  type        = string
}

variable "datalake_lifecycle_rule_condition_age_days" {
  description = "Age in days for life cycle rule in data lake."
  type        = number
}

variable "datalake_force_destroy" {
  description = "Enable force destroy for data lake."
  type        = bool
}

variable "ingest_business_data_script_path" {
  description = "Path to the ingest_businesses_data script"
  type        = string
}

variable "ingest_checkin_data_script_path" {
  description = "Path to the ingest_checkin_data script"
  type        = string
}

variable "ingest_reviews_data_script_path" {
  description = "Path to the ingest_reviews_data script"
  type        = string
}

variable "ingest_tips_data_script_path" {
  description = "Path to the ingest_tips_data script"
  type        = string
}

variable "ingest_users_data_script_path" {
  description = "Path to the ingest_users_data script"
  type        = string
}