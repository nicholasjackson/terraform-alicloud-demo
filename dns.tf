# Create a DNSimple record and point to the load balancer
resource "dnsimple_record" "gophersearch" {
  count = "${var.dnsimple_enabled}"

  domain = "${var.dnsimple_tld}"
  name   = "gopher.${local.prefix}"
  value  = "${alicloud_slb.gophersearch-frontend.address}"
  type   = "A"
  ttl    = 3600
}
