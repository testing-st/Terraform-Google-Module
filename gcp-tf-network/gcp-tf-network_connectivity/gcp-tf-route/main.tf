resource "google_compute_route" "route" {
  dest_range             = var.dest_range
  name                   = var.name
  network                = var.network
  description            = var.description
  priority               = var.priority
  tags                   = var.tags
  next_hop_gateway       = var.next_hop_gateway
  next_hop_instance      = var.next_hop_instance
  next_hop_ip            = var.next_hop_ip
  next_hop_vpn_tunnel    = var.next_hop_vpn_tunnel
  next_hop_ilb           = var.next_hop_ilb
  project                = var.project_id
  next_hop_instance_zone = var.next_hop_instance_zone
}