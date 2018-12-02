provider "aws" {
  #  if you haven't installed and configured the aws cli, you will need to provide your aws access key and secret key.
  #  access_key = "${var.aws_access_key}"
  #  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
}

resource "aws_cloudformation_stack" "VPCStack" {
  name = "VPCStack"

  parameters = {
    AvailabilityZones   = "${var.AvailabilityZones}"
    KeyPairName         = "${var.KeyPairName}"
    NumberOfAZs         = "${var.NumberOfAZs}"
    PrivateSubnet1ACIDR = "${var.PrivateSubnet1CIDR}"
    PrivateSubnet2ACIDR = "${var.PrivateSubnet2CIDR}"
    PublicSubnet1CIDR   = "${var.PublicSubnet1CIDR}"
    PublicSubnet2CIDR   = "${var.PublicSubnet2CIDR}"
    VPCCIDR             = "${var.VPCCIDR}"
  }

  template_url = "https://github.com/firehawkvfx/terraform-quickstart-microsoft-activedirectory/blob/master/templates/ad-master-1.template"
}
