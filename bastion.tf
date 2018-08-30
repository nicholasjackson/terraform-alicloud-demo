# Fetch the id of our custom image which we created with Packer
data "alicloud_images" "bastion" {
  owners      = "self"
  name_regex  = "^bastion"
  most_recent = true
}

# Create a web server
resource "alicloud_instance" "bastion" {
  image_id             = "${data.alicloud_images.bastion.images.0.id}"
  internet_charge_type = "PayByTraffic"

  internet_max_bandwidth_out = "100"

  instance_type        = "${data.alicloud_instance_types.2c4g.instance_types.0.id}"
  system_disk_category = "cloud_efficiency"
  security_groups      = ["${alicloud_security_group.default.id}"]
  instance_name        = "${local.prefix}-bastion"
  vswitch_id           = "${alicloud_vswitch.vsw.id}"
  key_name             = "${alicloud_key_pair.publickey.key_name}"
}
