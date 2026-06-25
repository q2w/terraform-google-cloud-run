resource "google_cloud_run_v2_service" "default" {
  name                = var.service_name
  project             = var.project_id
  location            = var.location
  ingress             = "INGRESS_TRAFFIC_ALL"
  deletion_protection = false # Allows 'terraform destroy' to delete without manual confirmation

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello:latest" # Google's sample image
    }
  }
}