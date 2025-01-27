variable "name" {
  description = "Required) The name of the resource (Max 25 characters)."
  type = string
}
variable "network" {
  description = "(Optional) Name or self_link of the VPC network. Required if ip_cidr_range is set."
  type = string
}
variable "ip_cidr_range" {
  description = "(Optional) The range of internal addresses that follows RFC 4632 notation. Example: 10.132.0.0/28"
  type = string
}
variable "machine_type" {
  description = "(Optional) Machine type of VM Instance underlying connector. Default is e2-micro"
  type = string
}
variable "min_throughput" {
  description = "(Optional) Minimum throughput of the connector in Mbps. Default and min is 200. Refers to the expected throughput when using an e2-micro machine type. Value must be a multiple of 100 from 200 through 900. Must be lower than the value specified by max_throughput. Only one of min_throughput and min_instances can be specified. The use of min_throughput is discouraged in favor of min_instances."
  type = string
}
variable "min_instances" {
  description = "(Optional) Minimum value of instances in autoscaling group underlying the connector. Value must be between 2 and 9, inclusive. Must be lower than the value specified by max_instances."
  type = string
}
variable "max_instances" {
  description = "(Optional) Maximum value of instances in autoscaling group underlying the connector. Value must be between 3 and 10, inclusive. Must be higher than the value specified by min_instances."
  type = string
}
variable "max_throughput" {
  description = "(Optional) Maximum throughput of the connector in Mbps, must be greater than min_throughput. Default is 300. Refers to the expected throughput when using an e2-micro machine type. Value must be a multiple of 100 from 300 through 1000. Must be higher than the value specified by min_throughput. Only one of max_throughput and max_instances can be specified. The use of max_throughput is discouraged in favor of max_instances."
  type = string
}
variable "subnet" {
  description = "(Optional) The subnet in which to house the connector"
  type = list(object({
    name = string
    project_id = string
  }))
}
variable "region" {
  description = "(Optional) Region where the VPC Access connector resides. If it is not provided, the provider region is used."
  type = string
}
variable "project" {
  description = "(Optional) The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type = string
}