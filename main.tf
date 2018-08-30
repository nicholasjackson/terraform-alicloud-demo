provider "alicloud" {}

terraform {
  backend "s3" {
    bucket   = "tfstate"
    key      = "simpledemo/terraform.tfstate"
    region   = "us-east-1"
    endpoint = "https://oss-eu-central-1.aliyuncs.com"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
  }
}

resource "tls_private_key" "server" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "alicloud_key_pair" "publickey" {
    key_name = "gophersearch_public_key"
    public_key = "${tls_private_key.server.public_key_openssh}"
}