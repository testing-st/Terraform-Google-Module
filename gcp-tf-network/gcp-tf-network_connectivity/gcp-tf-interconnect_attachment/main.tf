resource "google_compute_interconnect_attachment" "name" {
    router                   = var.router_output_id
    name                     = var.interconnect_attachment_name
    admin_enabled            = var.admin_enabled
    interconnect             = var.interconnect
    description              = var.description
    mtu                      = var.mtu
    bandwidth                = var.bandwidth
    edge_availability_domain = var.edge_availability_domain
    type                     = var.type
    candidate_subnets        = var.candidate_subnets
    vlan_tag8021q            = var.vlan_tag8021q
    ipsec_internal_addresses = var.ipsec_internal_addresses
    encryption               = var.encryption
    stack_type               = var.stack_type
    subnet_length            = var.subnet_length
    region                   = var.region
    project                  = var.project

}