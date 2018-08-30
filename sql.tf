# We can use the random_string resource to generate a random password
# for our database, this password will be stored in terraform state and
# is only generated once
resource "random_string" "db_password" {
  length      = 16
  special     = false
  min_numeric = 5
}

resource "alicloud_db_instance" "gophersearch" {
  engine           = "PostgreSQL"
  engine_version   = "9.4"
  instance_type    = "rds.pg.t1.small"
  instance_storage = "10"
  vswitch_id       = "${alicloud_vswitch.vsw.id}"

  # Only allow traffic from our bastion host and web server
  security_ips = [
    "${alicloud_instance.web.*.private_ip}",
    "${alicloud_instance.bastion.private_ip}",
  ]
}

resource "alicloud_db_account" "default" {
  instance_id = "${alicloud_db_instance.gophersearch.id}"
  name        = "${var.db_user}"
  password    = "${random_string.db_password.result}"
}

# Remote provision the scaffold data to the database for the application
# We are using a null resource as before we can provision we need both the 
# database and the account details to have been created
resource "null_resource" "db_provision" {
  triggers = {
    dbs_ids = "${alicloud_db_instance.gophersearch.id},${alicloud_db_account.default.id}"
  }

  connection {
    host        = "${alicloud_instance.bastion.public_ip}"
    user        = "root"
    private_key = "${tls_private_key.server.private_key_pem}"
  }

  // Copy the files for setting up the database with defaults values
  provisioner "file" {
    source      = "scripts/database.sql"
    destination = "/tmp/database.sql"
  }

  // Create a script with the correct connection data to provsion our initial data
  provisioner "file" {
    destination = "/tmp/database_provision.sh"

    content = <<EOF
#!/bin/bash
PGPASSWORD=${random_string.db_password.result} \
psql "sslmode=disable" \
  --host=${alicloud_db_instance.gophersearch.connection_string} \
  --port=${alicloud_db_instance.gophersearch.port} \
  --dbname=postgres \
  --username=${var.db_user} \
  < /tmp/database.sql
EOF
  }

  // Execute the script and copy the initial data to the database
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/database_provision.sh",
      "/tmp/database_provision.sh",
    ]
  }
}
