#resource "aws_instance" "main-server" {
#  ami           = "ami-06e0ce9d3339cb039"
#  instance_type = "t1.micro"
#}

#checkov:skip=CKV2_AWS_39:"very good explanation here"
#checkov:skip=CKV2_AWS_38:"very good explanation here"
resource "aws_route53_zone" "example_zone" {
  name = "hest.test"
}
