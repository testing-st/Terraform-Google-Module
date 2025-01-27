#...................................................... locals .................................................#

variable "health_check_type" {
  type          = string
  description   = "Indicates the type of health check: HTTP or Non-HTTP"
}
variable "project_id" {
  type          = string
  description   = "The ID of the project in which the resource belongs."
}
variable "region" {
  type          = string
  description   = "An instance template is a global resource that is not bound to a zone or a region."
}
variable "health_check_name" {
  type          = string
  description   = "Name of the resource. "
}
variable "health_check_description" {
  type          = string
  description   = "An optional description of this resource."
}
variable "check_interval_sec" {
  type          = string
  description   = "How often (in seconds) to send a health check."
}
variable "timeout_sec" {
  type          = string
  description   = "How long (in seconds) to wait before claiming failure."
}
variable "healthy_threshold" {
  type          = string
  description   = "A so-far unhealthy instance will be marked healthy after this many consecutive successes."
}
variable "unhealthy_threshold" {
  type          = string
  description   = "A so-far healthy instance will be marked unhealthy after this many consecutive failures."
}


#.................................................. Health Check ................................................#
variable "source_regions" {
  type = list(string)
  description = "Optional) The list of cloud regions from which health checks are performed. If any regions are specified, then exactly 3 regions should be specified. The region names must be valid names of Google Cloud regions. This can only be set for global health check. If this list is non-empty, then there are restrictions on what other health check fields are supported and what other resources can use this health check"
}

variable "http_health_check" {
  description   = "(Optional) A nested object resource"
  type          = list(object({
    host               = string    
    request_path       = string
    response           = string
    port               = number
    port_name          = string
    proxy_header       = string
    port_specification = string
  })) 
  default       = []
}
variable "https_health_check" {
  description = "(Optional) A nested object resource"
  type = list(object({
    host               = string
    request_path       = string
    response           = string
    port               = number
    port_name          = string
    proxy_header       = string
    port_specification = string
  }))
}
variable "tcp_health_check" {
  description   = " = string(Optional) A nested object resource"
  type          = list(object({
    request     = string
    response    = string
    port        = number
    port_name   = string
    proxy_header = string
    port_specification = string

  }))
  default       = []
}
variable "ssl_health_check" {
  description = "Optional) A nested object resource"
  type = list(object({
    request      = string
    response     = string
    port         = number
    port_name    = string
    proxy_header = string
    port_specification- = string
  }))
}
variable "http2_health_check" {
  description = " A nested object resource"
  type = list(object({
    host               = string
    request_path       = string
    response           = string
    port               = number
    port_name          = string
    proxy_header       = string
    port_specification = string
  }))
}
variable "grpc_health_check" {
  description = "A nested object resource"
  type = list(object({
    port               = number
    port_name          = string
    port_specification = string
  }))
}
variable "log_config" {
  description = "Configure logging on this health check."
  type = list(object({
    enable = bool
  }))
}