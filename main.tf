provider "alicloud" {}

# Configure backend to use Alicloud Object Storage
# We are using the S3 backend as Alicloud Object Store is S3 API compatable
terraform {
  backend "s3" {
    bucket   = "tfstate"
    key      = "simpledemo/terraform.tfstate"
    region   = "us-east-1"
    endpoint = "https://oss-eu-central-1.aliyuncs.com"

    # Disable all checks when not explicity using AWS S3
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
  }
}

# Generate a private key pair for access to servers
# Note: this key is persisted to terraform state
resource "tls_private_key" "server" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "alicloud_key_pair" "publickey" {
  key_name   = "gophersearch_public_key"
  public_key = "${tls_private_key.server.public_key_openssh}"
}

# Create a local variable to use for prefixing infrastructure names
locals {
  prefix = "${terraform.workspace}"
}
