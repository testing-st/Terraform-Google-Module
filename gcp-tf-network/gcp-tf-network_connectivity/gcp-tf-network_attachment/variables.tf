variable "connection_preference" {
  type = string
  description = " (Required) The connection preference of service attachment. The value can be set to ACCEPT_AUTOMATIC. An ACCEPT_AUTOMATIC service attachment is one that always accepts the connection from consumer forwarding rules. Possible values are: ACCEPT_AUTOMATIC, ACCEPT_MANUAL, INVALID."
}
variable "subnetworks" {
  type = list(string)
  description = "(Required) An array of URLs where each entry is the URL of a subnet provided by the service consumer to use for endpoints in the producers that connect to this network attachment."
}
variable "name" {
  type = string
  description = "(Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression a-z? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash."
}
variable "region" {
  type = string
  description = "(Required) URL of the region where the network attachment resides. This field applies only to the region resource. You must specify this field as part of the HTTP request URL. It is not settable as a field in the request body."
}
variable "description" {
  type = string
}
variable "producer_reject_lists" {
  type = list(string)
  description = "(Optional) Projects that are not allowed to connect to this network attachment. The project can be specified using its id or number."
}
variable "producer_accept_lists" {
  type = list(string)
  description = "(Optional) Projects that are allowed to connect to this network attachment. The project can be specified using its id or number."
}
variable "project_id" {
  type = string
  description = " (Optional) The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
}