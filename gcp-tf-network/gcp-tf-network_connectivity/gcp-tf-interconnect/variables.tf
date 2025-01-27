variable "interconnect_name" {
  description = "(Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. "
  type        = string
}
variable "link_type" {
  description = "Required) Type of link requested. Note that this field indicates the speed of each of the links in the bundle, not the speed of the entire bundle."
  type        = string
}
variable "requested_link_count" {
  description = "Required) Target number of physical links in the link bundle, as requested by the customer."
  type        = string
}
variable "interconnect_type" {
  description = "(Required) Type of interconnect. Note that a value IT_PRIVATE has been deprecated in favor of DEDICATED."
  type        = string
}
variable "description" {
  description = "(Optional) An optional description of this resource. Provide this property when you create the resource."
  type        = string
}
variable "location" {
  description = "(Optional) URL of the InterconnectLocation object that represents where this connection is to be provisioned. Specifies the location inside Google's Networks, should not be passed in case of cross-cloud interconnect."
  type        = string
}
variable "admin_enabled" {
  description = "(Optional) Administrative status of the interconnect. When this is set to true, the Interconnect is functional and can carry traffic. When set to false, no packets can be carried over the interconnect and no BGP routes are exchanged over it. By default, the status is set to true."
  type        = bool
}
variable "noc_contact_email" {
  description = "(Optional) Email address to contact the customer NOC for operations and maintenance notifications regarding this Interconnect."
  type        = string
}
variable "customer_name" {
  description = "(Optional) Customer name, to put in the Letter of Authorization as the party authorized to request a crossconnect. This field is required for Dedicated and Partner Interconnect, should not be specified for cross-cloud interconnect."
  type        = string
}
variable "labels" {
  description = "(Optional) Labels for this resource. These can only be added or modified by the setLabels method. Each label key/value pair must comply with RFC1035. Label values may be empty."
  type        = map(string)
}
variable "macsec" {
  description       = "(Optional) Configuration that enables Media Access Control security (MACsec) on the Cloud Interconnect connection between Google and your on-premises router."
  type              = list(object({
    pre_shared_keys = list(object({
      name          = string
      start_time    = string
    }))
    fail_open       = string
  }))
}
variable "macsec_enabled" {
  description = "(Optional) Enable or disable MACsec on this Interconnect connection. MACsec enablement fails if the MACsec object is not specified."
  type        = string
}
variable "remote_location" {
  description = "(Optional) Indicates that this is a Cross-Cloud Interconnect. This field specifies the location outside of Google's network that the interconnect is connected to."
  type        = string
}
variable "requested_features" {
  description = " (Optional) interconnects.list of features requested for this Interconnect connection."
  type        = any
}
variable "project" {
  description = "(Optional) The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}
