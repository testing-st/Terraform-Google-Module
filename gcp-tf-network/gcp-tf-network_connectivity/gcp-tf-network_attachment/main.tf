resource "google_compute_network_attachment" "name" {
    connection_preference = var.connection_preference
    subnetworks           = var.subnetworks
    name                  = var.name
    region                = var.region
    description           = var.description
    producer_reject_lists = var.producer_reject_lists
    producer_accept_lists = var.producer_accept_lists
    project               = var.project_id
}