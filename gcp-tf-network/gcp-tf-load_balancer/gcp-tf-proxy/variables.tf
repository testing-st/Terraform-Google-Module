#...................................................... locals .................................................#

variable "scope" {
  type                                  = string
  description                           = "Scope of the services: global or regional"
}
variable "project_id" {
  type                                  = string
  description                           = "The ID of the project in which the resource belongs."
}
variable "region" {
  type                                  = string
  description                           = "The region of the project in which the resource belongs."
}
variable "target_proxy_type" {
  type                                  = string
  description                           = "The target proxy type: HTTP or HTTPS"
}
variable "proxy_name" {
  type                                  = string
  description                           = "Name of the resource."
}
variable "proxy_description" {
  type                                  = string
  description                           = "An optional description of this resource."
}
variable "proxy_bind" {
  type                                  = string
  description                           = "(Optional) This field only applies when the forwarding rule that references this target proxy has a loadBalancingScheme set to INTERNAL_SELF_MANAGED."
}
variable "http_keep_alive_timeout_sec" {
  type                                  = number
  description                           = "(Optional) Specifies how long to keep a connection open, after completing a response, while there is no matching traffic (in seconds)"
}
variable "certificate_manager_certificates" {
  type                                  = list(string)
  description                           = "(Optional) URLs to certificate manager certificate resources that are used to authenticate connections between users and the load balancer."
}
variable "ssl_certificates_id" {
  type                                  = list(string)
  description                           = "(Optional) URLs to SslCertificate resources that are used to authenticate connections between users and the load balancer."
}
variable "ssl_policy" {
  type                                  = string
  description                           = "(Optional) A reference to the SslPolicy resource that will be associated with the TargetHttpsProxy resource."
}

#.................................................... Proxy ....................................................#

variable "url_map_id" {
  type                                  = string
  description                           = "(Optional) The ID of the URL MAP"
}
variable "proxy_project_id" {
  type                                  = string
  description                           = "(Optional) The ID of the project in which the resource belongs. "
}
variable "quic_override" {
  type                                  = string
  description                           = "(Optional) Specifies the QUIC override policy for this resource."
}
variable "tls_early_data" {
  description = "Optional) Specifies whether TLS 1.3 0-RTT Data (“Early Data”) should be accepted for this service. Early Data allows a TLS resumption handshake to include the initial application payload (a HTTP request) alongside the handshake, reducing the effective round trips to “zero”. This applies to TLS 1.3 connections over TCP (HTTP/2) as well as over UDP (QUIC/h3). Possible values are: STRICT, PERMISSIVE, DISABLED."
  type = string
}
variable "certificate_map" {
  type                                  = string
  description                           = "(Optional) A reference to the CertificateMap resource uri that identifies a certificate map associated with the given target proxy."
}
variable "server_tls_policy" {
  type                                  = string
  description                           = "(Optional) A URL referring to a networksecurity.ServerTlsPolicy resource that describes how the proxy should authenticate inbound traffic."
}
