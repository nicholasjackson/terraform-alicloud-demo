output "private_key" {
  value = "${tls_private_key.server.private_key_pem}"
}

output "jumpbox_public_ip" {
  value = "${alicloud_instance.jumpbox.public_ip}"
}

output "web_public_ip" {
  value = "${alicloud_slb.gophersearch-frontend.address}"
}
