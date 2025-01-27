resource "google_service_networking_connection" "default" {
  provider                = google_beta 
  network                 = var.network
  service                 = var.service 
  reserved_peering_ranges = var.ranges
  deletion_policy         = var.deletion_policy
  update_on_creation_fail = var.update_on_creation_fail
}
