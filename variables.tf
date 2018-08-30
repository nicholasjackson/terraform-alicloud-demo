variable "availability_zones" {
  description = "Availability Zones to deploy resources to"
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "web_instance_count" {
  description = "The number of web instances to create"
  default     = 1
}

variable "db_user" {
  description = "Database username"
  default     = "gophersearch"
}

variable "dnsimple_tld" {
  description = "Top level domain name for DNSimple domain"
  default     = "demo.gs"
}

variable "dnsimple_enabled" {
  description = "Enable DNS entry for DNSimple"
  default     = 1
}
