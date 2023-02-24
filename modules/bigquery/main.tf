resource "google_bigquery_dataset" "yelp_staging" {
  dataset_id = var.yelp_staging_dataset
  project = var.project
  location = var.region
  description = "Stores staging tables for yelp."

  delete_contents_on_destroy = true
}

resource "google_bigquery_table" "stg_businesses" {
  dataset_id = google_bigquery_dataset.yelp_staging.dataset_id
  table_id   = var.business_staging_table
  description = "Staging businesses table"
  deletion_protection = false

  schema = <<EOF
[
  {
    "name": "business_id",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "address",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "city",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "state",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "postal_code",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "latitude",
    "type": "FLOAT",
    "mode": "NULLABLE"
  },
  {
    "name": "longitude",
    "type": "FLOAT",
    "mode": "NULLABLE"
  },
  {
    "name": "stars",
    "type": "FLOAT",
    "mode": "NULLABLE"
  },
  {
    "name": "review_count",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "is_open",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "categories",
    "type": "STRING",
    "mode": "NULLABLE"
  }
]
EOF

  range_partitioning {
    field = "is_open"
    range {
      start = 0
      end = 2
      interval = 1
    }
  }

  depends_on = [google_bigquery_dataset.yelp_staging]
}