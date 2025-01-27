resource "google_compute_router" "router" {
  provider                        = google-beta
  #count                           = var.create_router == true ? 1 : 0
  name                            = var.router_name
  network                         = var.network
  description                     = var.router_description
  
  dynamic "bgp" {
    for_each                      = var.bgp
    content {
      asn                         = bgp.value.asn
      advertise_mode              = bgp.value.advertise_mode
      advertised_groups           = bgp.value.advertised_groups
      dynamic "advertised_ip_ranges" {
        for_each                  = lookup(bgp.value, "advertised_ip_ranges", [])
        content {
          range                   = advertised_ip_ranges.value.range
          description             = advertised_ip_ranges.value.description
        }
      }
      keepalive_interval          = bgp.value.keepalive_interval
      identifier_range            = bgp.value.identifier_range
    }
  }

  encrypted_interconnect_router   = var.encrypted_interconnect_router
  region                          = var.region
  project                         = var.project_id
}
