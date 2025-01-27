resource "google_vpc_access_connector" "name" {
    name                           = var.name
    network                        = var.network
    ip_cidr_range                  = var.ip_cidr_range
    machine_type                   = var.machine_type
    min_throughput                 = var.min_throughput
    min_instances                  = var.min_instances
    max_instances                  = var.max_instances
    max_throughput                 = var.max_throughput
    dynamic "subnet" {
        for_each = var.subnet
        content {
          name                     = lookup(subnet.value, "name" ,"")
          project_id               = lookup(subnet.value, "project_id" ,"")
        }
      
    }
    region                         = var.region
    project                        = var.project
  
}