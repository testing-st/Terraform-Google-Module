output "global_address_details" {
  description = "Global Address Details."
  value       = google_compute_global_address.default
}
output "global_private_service_connection_details" {
  description = "Private Service Networking Connection Details."
  value       = google_service_networking_connection.default
}