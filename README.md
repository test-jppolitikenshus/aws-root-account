# Bootstrap Repository

This terraform repository (aws-root-account) is the entrypoint for establishing the Github organisation, including the AWS organisation, used for the Cloudv2 platform. The repository contains things like:

* repository and team configuration for github organisation
* aws organisations
* aws control tower
* aws root account, and audit and log account
* scp and security

Three GitHub organizations are presently used for this purpose:
- commercial-tech: This is Commercial & Tech's organisation containing this template bootstrap repository
- jppolitikenshus: This is the public organisation used for JPPol repositories, including the Cloudv2 Platform
- test-jppolitikenshus: This is a test organisation used for github and aws testing with the aws-test-master account 


# Bootstrapping a test AWS environment

0. Checkout aws-root-account repository: gh repo clone commercial-tech/aws-root-account aws-root-account
1. Make sure your Github user owns the github organisation you want to use.
2. Authenticate to github using `gh auth login` 
3. Define the github organisation and terraform tag in `<org>/aws-root-account/terraform/github/backend.tf`
4. Define aws account id and github organisation in `<org>/aws-root-account/terraform/github/openid.tf`
5. Authenticate to your test AWS account
6. terraform apply 


