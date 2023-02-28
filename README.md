# GCP Infrastructure Management for Yelp Dataset Processing

This is the infrastructure definition for an end-to-end data engineering project for yelp dataset processing, based on Terraform.

### Prerequisites

1. A GCP Project
2. A Google service account and its JSON private key file
3. Terraform

### Creating Infrastructure

All the values for the infrastructure resources can be found in the `terraform.tfvars` file.

> Before proceeding, make sure to create an environment variable `GOOGLE_APPLICATION_CREDENTIALS` pointing to the location of your JSON private key file of the service account.

1. Change the values in the `terraform.tfvars` file that are marked as `// TODO` as per your preference and gcp project.
2. Run `terraform apply`.
3. Review the resources and enter "yes" to start the creation.
4. It will take around 45 mins to create all the resources.

_**Note:** Resources can be destroyed using the command `terraform destroy`_ Although cloud composer creates a GCP bucket for dags which is not deleted by this command. So it needs to be deleted manually. (Please suggest if there's a better way to do it)

### Future Improvements

- Setup a CI/CD Pipeline
- Create configurations for multiple environments