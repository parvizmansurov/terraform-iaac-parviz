resource "aws_route53_record" "wordpress" {
  zone_id = "Z2GBIWT5ZS4BBY"
  name    = "wordpress.example.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_eip.lb.public_ip}"]
}