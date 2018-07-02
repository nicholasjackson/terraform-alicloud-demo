provider "alicloud" {}

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
