terraform {
  backend "s3" {
    bucket   = "tfstate"
    key      = "demo/terraform.tfstate"
    region   = "us-east-1"
    endpoint = "https://oss-eu-central-1.aliyuncs.com"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
  }
}

data "alicloud_instance_types" "2c4g" {
  cpu_core_count = 1
  memory_size    = 1
}

resource "alicloud_vpc" "vpc" {
  name       = "tf_test_foo-${terraform.workspace}"
  cidr_block = "172.16.0.0/12"
}

# Create security group
resource "alicloud_security_group" "default" {
  name        = "default-${terraform.workspace}"
  description = "default"
  vpc_id      = "${alicloud_vpc.vpc.id}"
}

resource "alicloud_vswitch" "vsw" {
  vpc_id            = "${alicloud_vpc.vpc.id}"
  cidr_block        = "172.16.0.0/21"
  availability_zone = "eu-central-1a"
}

# Create a web server
resource "alicloud_instance" "web" {
  # cn-beijing
  image_id             = "ubuntu_140405_32_40G_cloudinit_20161115.vhd"
  internet_charge_type = "PayByBandwidth"

  instance_type        = "${data.alicloud_instance_types.2c4g.instance_types.0.id}"
  system_disk_category = "cloud_efficiency"
  security_groups      = ["${alicloud_security_group.default.id}"]
  instance_name        = "${terraform.workspace}-web"
  vswitch_id           = "${alicloud_vswitch.vsw.id}"
}

module "webapp" {
  source = "github.com/nicholasjackson/alicloud-terraform-templates/hosting/web-application-hosting"

  region        = "eu-central-1"
  solution_name = "test"

  web_layer_name         = "weblayer"
  web_instance_count     = "1"
  web_availability_zone  = "a"
  web_instance_type      = "${data.alicloud_instance_types.2c4g.instance_types.0.id}"
  web_instance_port      = "80"
  web_instance_image_id  = "ubuntu_16_0402_64_20G_alibase_20170818.vhd"
  web_instance_user_data = ""

  app_layer_name         = "applayer"
  app_instance_count     = "1"
  app_availability_zone  = "a"
  app_instance_type      = "${data.alicloud_instance_types.2c4g.instance_types.0.id}"
  app_instance_port      = "5000"
  app_instance_image_id  = "ubuntu_16_0402_64_20G_alibase_20170818.vhd"
  app_instance_user_data = ""

  db_layer_name        = "dblayer"
  db_availability_zone = "a"
  db_engine            = "MySQL"
  db_engine_version    = "5.6"
  db_instance_type     = "mysql.n1.micro.1"
  db_instance_storage  = "20"
}

output "slb_web_public_ip" {
  value = "${module.webapp.slb_web_public_ip}"
}
