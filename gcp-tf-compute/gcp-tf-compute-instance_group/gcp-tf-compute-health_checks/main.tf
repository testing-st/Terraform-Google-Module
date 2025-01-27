#...................................................... locals .................................................#

locals {
    health_check_type           = var.health_check_type
    project                     = var.project_id
    health_check_name           = var.health_check_name
    health_check_description    = var.health_check_description
    check_interval_sec          = var.check_interval_sec
    timeout_sec                 = var.timeout_sec
    healthy_threshold           = var.healthy_threshold
    unhealthy_threshold         = var.unhealthy_threshold
    http_health_check           = var.http_health_check 
    https_health_check          = var.https_health_check
    tcp_health_check            = var.tcp_health_check  
    ssl_health_check            = var.ssl_health_check  
    http2_health_check          = var.http2_health_check
    grpc_health_check           = var.grpc_health_check 
    log_config                  = var.log_config        
   
}

#.................................................. Global Health Check ................................................#

resource "google_compute_health_check" "healthcheck" {
    count                       = local.health_check_type == "global" ? 1 : 0    
    project                     = local.project
    name                        = local.health_check_name
    check_interval_sec          = local.check_interval_sec
    description                 = local.health_check_description
    healthy_threshold           = local.healthy_threshold
    timeout_sec                 = local.timeout_sec
    source_regions              = var.source_regions
    unhealthy_threshold         = local.unhealthy_threshold
    dynamic "http_health_check" {
        for_each                = local.http_health_check[*]
        content {
            host                = lookup(http_health_check.value, "host", null)
            request_path        = lookup(http_health_check.value, "request_path", null)
            response            = lookup(http_health_check.value, "response", null)
            port                = lookup(http_health_check.value, "port", null)
            port_name           = lookup(http_health_check.value, "port_name", null)
            proxy_header        = lookup(http_health_check.value, "proxy_header", null)
            port_specification  = lookup(http_health_check.value, "port_specification", null)
        }
    }
    dynamic "https_health_check" {
      for_each = local.https_health_check[*]
      content {
        host               = lookup(https_health_check.value, "host" , "")
        request_path       = lookup(https_health_check.value, "request_path" , "")
        response           = lookup(https_health_check.value, "response" , "")
        port               = lookup(https_health_check.value, "port" , "")
        port_name          = lookup(https_health_check.value, "port_name" , "")
        proxy_header       = lookup(https_health_check.value, "proxy_header" , "")
        port_specification = lookup(https_health_check.value, "port_specification" , "")
      }
    }
    dynamic "tcp_health_check" {
        for_each                = var.tcp_health_check[*]
        content {
            request             = lookup(tcp_health_check.value, "request", null) 
            response            = lookup(tcp_health_check.value, "response", null)
            port                = lookup(tcp_health_check.value, "port", null)
            proxy_header        = lookup(tcp_health_check.value, "proxy_header", null)
            port_specification  = lookup(tcp_health_check.value, "port_specification", null)
        }
    }
    dynamic "ssl_health_check" {
      for_each = local.ssl_health_check[*]
      content {
        request            = lookup(ssl_health_check.value,"request","")
        response           = lookup(ssl_health_check.value,"response","")
        port               = lookup(ssl_health_check.value,"port","")
        port_name          = lookup(ssl_health_check.value,"port_name","")
        proxy_header       = lookup(ssl_health_check.value,"proxy_header","")
        port_specification = lookup(ssl_health_check.value,"port_specification","")
      }
    }
    dynamic "http2_health_check" {
      for_each = local.http2_health_check[*]
      content {
        host               = lookup(http2_health_check.value, "host", "")
        request_path       = lookup(http2_health_check.value, "request_path", "")
        response           = lookup(http2_health_check.value, "response", "")
        port               = lookup(http2_health_check.value, "port", "")
        port_name          = lookup(http2_health_check.value, "port_name", "")
        proxy_header       = lookup(http2_health_check.value, "proxy_header", "")
        port_specification = lookup(http2_health_check.value, "port_specification", "")
      }
    }
    dynamic "grpc_health_check" {
        for_each = local.grpc_health_check[*]
        content {
          port               = lookup(grpc_health_check.value, "port", "")
          port_name          = lookup(grpc_health_check.value, "port_name", "")
          port_specification = lookup(grpc_health_check.value, "port_specification", "")
        }
    }
    dynamic "log_config" {
      for_each = local.log_config[*]
      content {
        enable = lookup(log_config.value, "enable", "")
      }
    }
}

#..................................................Region Health Check ................................................#

resource "google_compute_region_health_check" "healthcheck" {
  count                       = local.health_check_type == "region" ? 1 : 0    
  name                        = local.health_check_name
  check_interval_sec          = local.check_interval_sec
  description                 = local.health_check_description
  healthy_threshold           = local.healthy_threshold
  unhealthy_threshold         = local.unhealthy_threshold
  timeout_sec                 = local.timeout_sec
  dynamic "http_health_check" {
        for_each                = local.http_health_check[*]
        content {
            host                = lookup(http_health_check.value, "host", null)
            request_path        = lookup(http_health_check.value, "request_path", null)
            response            = lookup(http_health_check.value, "response", null)
            port                = lookup(http_health_check.value, "port", null)
            port_name           = lookup(http_health_check.value, "port_name", null)
            proxy_header        = lookup(http_health_check.value, "proxy_header", null)
            port_specification  = lookup(http_health_check.value, "port_specification", null)
        }
  }
  dynamic "https_health_check" {
      for_each = local.https_health_check[*]
      content {
        host               = lookup(https_health_check.value, "host" , "")
        request_path       = lookup(https_health_check.value, "request_path" , "")
        response           = lookup(https_health_check.value, "response" , "")
        port               = lookup(https_health_check.value, "port" , "")
        port_name          = lookup(https_health_check.value, "port_name" , "")
        proxy_header       = lookup(https_health_check.value, "proxy_header" , "")
        port_specification = lookup(https_health_check.value, "port_specification" , "")
      }
  }
  dynamic "tcp_health_check" {
        for_each                = local.tcp_health_check[*]
        content {
            request             = lookup(tcp_health_check.value, "request", null) 
            response            = lookup(tcp_health_check.value, "response", null)
            port                = lookup(tcp_health_check.value, "port", null)
            proxy_header        = lookup(tcp_health_check.value, "proxy_header", null)
            port_specification  = lookup(tcp_health_check.value, "port_specification", null)
        }
  }
  dynamic "ssl_health_check" {
      for_each = local.ssl_health_check[*]
      content {
        request            = lookup(ssl_health_check.value,"request","")
        response           = lookup(ssl_health_check.value,"response","")
        port               = lookup(ssl_health_check.value,"port","")
        port_name          = lookup(ssl_health_check.value,"port_name","")
        proxy_header       = lookup(ssl_health_check.value,"proxy_header","")
        port_specification = lookup(ssl_health_check.value,"port_specification","")
      }
  }
  dynamic "http2_health_check" {
      for_each = local.http2_health_check[*]
      content {
        host               = lookup(http2_health_check.value, "host", "")
        request_path       = lookup(http2_health_check.value, "request_path", "")
        response           = lookup(http2_health_check.value, "response", "")
        port               = lookup(http2_health_check.value, "port", "")
        port_name          = lookup(http2_health_check.value, "port_name", "")
        proxy_header       = lookup(http2_health_check.value, "proxy_header", "")
        port_specification = lookup(http2_health_check.value, "port_specification", "")
      }
  }
  dynamic "grpc_health_check" {
      for_each = local.grpc_health_check[*]
      content {
        port               = lookup(grpc_health_check.value, "port", "")
        port_name          = lookup(grpc_health_check.value, "port_name", "")
        port_specification = lookup(grpc_health_check.value, "port_specification", "")
      }
  }
  dynamic "log_config" {
      for_each = local.log_config[*]
      content {
        enable = lookup(log_config.value, "enable", "")
      }
  }
  project                     = local.project
  region                      = var.region
}