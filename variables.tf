variable "availability_zones" {
  default = ["eu-central-1a", "eu-central-1b"]
}

variable "web_instance_count" {
  description = "The number of web instances to create"
  default     = 1
}

variable "db_user" {
  default = "gophersearch"
}
