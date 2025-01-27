
resource "google_compute_interconnect" "name" {
    name                 = var.interconnect_name
    link_type            = var.link_type
    requested_link_count = var.requested_link_count
    interconnect_type    = var.interconnect_type
    description          = var.description
    location             = var.location
    admin_enabled        = var.admin_enabled
    noc_contact_email    = var.noc_contact_email
    customer_name        = var.customer_name
    labels               = var.labels
    dynamic "macsec" {
      for_each           = var.macsec
      content {
        dynamic "pre_shared_keys" {
          for_each       = lookup(macsec.value, "pre_shared_keys" , [])
          content {
            name         = lookup(pre_shared_keys.value, "name" ,"")
            start_time   = lookup(pre_shared_keys.value, "start_time" , "")
          }
        }
        fail_open        = lookup(macsec.value, "fail_open" ,"")
      }
    }
    macsec_enabled       = var.macsec_enabled
    remote_location      = var.remote_location
    requested_features   = var.requested_features
    project              = var.project 
}