#resource "aws_instance" "main-server" {
#  ami           = "ami-06e0ce9d3339cb039"
#  instance_type = "t1.micro"
#}

#resource "aws_route53_zone" "example_zone" {
#  #checkov:skip=CKV2_AWS_39:"very good explanation here"
#  #checkov:skip=CKV2_AWS_38:"very good explanation here"
#  name = "hest.test"
#}

resource "aws_account_alternate_contact" "alt_operations" {
  alternate_contact_type = "OPERATIONS"
  name                   = "asdfasdf"
  title                  = "asdfasdsf"
  phone_number           = "234243"
  email_address          = "asdf@sdf.dk"
}

resource "aws_account_alternate_contact" "alt_billing" {
  alternate_contact_type = "BILLING"
  name                   = "Finanace department"
  title                  = "Group Controller"
  phone_number           = "+4533472244"
  email_address          = "koncernokonomi@jppol.dk"
}

resource "aws_account_alternate_contact" "alt_security" {
  alternate_contact_type = "SECURITY"
  name                   = "nods"
  title                  = "agadddddsasdfn"
  phone_number           = "23434"
  email_address          = "asdf@asdf.dk"
}
