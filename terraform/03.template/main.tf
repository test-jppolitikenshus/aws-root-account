#resource "aws_instance" "main-server" {
#  ami           = "ami-06e0ce9d3339cb039"
#  instance_type = "t1.micro"
#}

resource "aws_route53_zone" "example_zone" {
  #checkov:skip=CKV2_AWS_39:"very good explanation here"
  #checkov:skip=CKV2_AWS_38:"very good explanation here"
  name = "hest.test"
}

resource "aws_account_alternate_contact" "testing123" {
  alternate_contact_type = "OPERATIONS"
  name                   = "blabla"
  title                  = "asdf"
  phone_number           = "234234"
  email_address          = "asdf@asdf.df"
}

resource "aws_account_alternate_contact" "testing1234" {
  alternate_contact_type = "BILLING"
  name                   = "blabla"
  title                  = "asdf"
  phone_number           = "234234"
  email_address          = "asfd@asdf.dk"
}

resource "aws_account_alternate_contact" "testing12345" {
  alternate_contact_type = "SECURITY"
  name                   = "blabla"
  title                  = "asdf"
  phone_number           = "234234"
  email_address          = "adsfasasasdadasdsdssdffffdf@asdf.dk"
}
