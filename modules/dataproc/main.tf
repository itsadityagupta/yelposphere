resource "google_dataproc_cluster" "capstone-project-cluster" {
  name = "capstone-project-cluster"
  region = "asia-south2"
  graceful_decommission_timeout = "120s"

  cluster_config {

    staging_bucket = var.dataproc_staging_bucket_name
    temp_bucket = var.dataproc_temp_bucket_name

    master_config {
      num_instances = 1
      machine_type = "e2-standard-2"

      disk_config {
        boot_disk_type = "pd-standard"
        boot_disk_size_gb = 30
      }
    }

    software_config {
      image_version = "2.1.4-ubuntu20"
      override_properties = {
        "dataproc:dataproc.allow.zero.workers" = "true"
      }
    }
  }


}