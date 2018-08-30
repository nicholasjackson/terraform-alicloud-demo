# Fetch the id of our custom image which we created with Packer
data "alicloud_images" "gophersearch" {
  owners      = "self"
  name_regex  = "^gophersearch"
  most_recent = true
}

data "alicloud_instance_types" "2c4g" {
  cpu_core_count = 1
  memory_size    = 1
}

# Create a web instance for the GopherSearch application
# The meta parameter count allows us to create multiple identical resources
resource "alicloud_instance" "web" {
  count = "${var.web_instance_count}"

  image_id             = "${data.alicloud_images.gophersearch.images.0.id}"
  internet_charge_type = "PayByTraffic"

  instance_type        = "${data.alicloud_instance_types.2c4g.instance_types.0.id}"
  system_disk_category = "cloud_efficiency"
  security_groups      = ["${alicloud_security_group.default.id}"]
  instance_name        = "${terraform.workspace}-web-${count.index}"
  vswitch_id           = "${alicloud_vswitch.vsw.id}"
  key_name             = "${alicloud_key_pair.publickey.key_name}"
}

# Configure the web instance with the database password
# we need to use a null resource to avoid a circular reference caused
# by the database instance referencing instance and the provisioner
# requiring a reference to the database.
# We need to create the same number of null_resources as we create 
# web instances as the config needs to be provisioned on each.
resource "null_resource" "web_config" {
  count = "${var.web_instance_count}"

  triggers {
    db = "${join(",",alicloud_instance.web.*.id)},${alicloud_db_instance.gophersearch.id}"
  }

  # Define the connection details for the instance
  connection {
    host        = "${element(alicloud_instance.web.*.private_ip, count.index)}"
    user        = "root"
    private_key = "${tls_private_key.server.private_key_pem}"

    #SSH is not accessible from the public internet for web hosts connect via the jumpbox
    bastion_host        = "${alicloud_instance.jumpbox.public_ip}"
    bastion_user        = "root"
    bastion_private_key = "${tls_private_key.server.private_key_pem}"
  }

  # Create an env file containing the db connection string, this is read by the app at startup
  provisioner "file" {
    destination = "/app/.env"

    content = <<EOF
GO_ENV=production
DATABASE_URL="postgres://${var.db_user}:${random_string.db_password.result}@${alicloud_db_instance.gophersearch.connection_string}:${alicloud_db_instance.gophersearch.port}/gophersearch?sslmode=disable"
EOF
  }

  provisioner "remote-exec" {
    inline = [
      "sudo systemctl restart gophersearch",
    ]
  }
}

resource "alicloud_slb" "gophersearch-frontend" {
  name                 = "gophersearch-frontend"
  internet             = true
  internet_charge_type = "paybytraffic"
  bandwidth            = 25
  vswitch_id           = "${alicloud_vswitch.vsw.id}"
}

resource "alicloud_slb_listener" "gophersearch-http" {
  load_balancer_id = "${alicloud_slb.gophersearch-frontend.id}"
  backend_port     = 3000
  frontend_port    = 80
  bandwidth        = 10
  protocol         = "http"

  health_check              = "on"
  health_check_type         = "http"
  health_check_connect_port = 3000
}

resource "alicloud_slb_attachment" "gophersearch" {
  load_balancer_id = "${alicloud_slb.gophersearch-frontend.id}"
  instance_ids     = ["${alicloud_instance.web.*.id}"]
}
