provider "aws" {
  #  if you haven't installed and configured the aws cli, you will need to provide your aws access key and secret key.
  #  access_key = "${var.aws_access_key}"
  #  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
}

variable "region" {
  default = "us-east-1"
}

variable "AvailabilityZones" {
  default = "ap-southeast-2a,ap-southeast-2b"
}

### these variables will be defined by you, are unique to you, and should not be pushed to the git repo.

### Create your own key pair and insert its name here
variable "KeyPairName" {
  default = "my_key_pair"
}

### Insert your own remote ip to access the gateway from.  This will open an RDP in the security group to your ip allowing remote access.
variable "RDGWCIDR" {
  default = "272.272.272.272/32"
}

### set this password and ensure it is unique, it is required to restore the domain.
/*
  variable "RestoreModePassword" {
  default = "thisPasswordMustBeChanged"
}
*/
### Set this user name to a unique name - this is the stack admin user name to login to the remote gateway and domain controllers.
variable "DomainAdminUser" {
  default = "StackAdmin"
}

### set this password and ensure it is unique
variable "DomainAdminPassword" {
  default = "thisPasswordAlsoMustBeChanged"
}

resource "aws_cloudformation_stack" "ADStack" {
  name               = "ADStack"
  capabilities       = ["CAPABILITY_IAM"]
  timeout_in_minutes = "60"

  parameters = {
    #Network Configuration
    AvailabilityZones  = "${var.AvailabilityZones}"
    NumberOfAZs        = "${var.NumberOfAZs}"
    PrivateSubnet1CIDR = "${var.PrivateSubnet1CIDR}"
    PrivateSubnet2CIDR = "${var.PrivateSubnet2CIDR}"
    PrivateSubnet3CIDR = "${var.PrivateSubnet3CIDR}"
    PublicSubnet1CIDR  = "${var.PublicSubnet1CIDR}"
    PublicSubnet2CIDR  = "${var.PublicSubnet2CIDR}"
    PublicSubnet3CIDR  = "${var.PublicSubnet3CIDR}"
    RDGWCIDR           = "${var.RDGWCIDR}"
    VPCCIDR            = "${var.VPCCIDR}"

    # EC2 Configuration
    KeyPairName           = "${var.KeyPairName}"
    ADServer1InstanceType = "${var.ADServer1InstanceType}"
    ADServer1NetBIOSName  = "${var.ADServer1NetBIOSName}"
    ADServer1PrivateIP    = "${var.ADServer1PrivateIP}"
    ADServer2InstanceType = "${var.ADServer2InstanceType}"
    ADServer2NetBIOSName  = "${var.ADServer2NetBIOSName}"
    ADServer2PrivateIP    = "${var.ADServer2PrivateIP}"
    RDGWInstanceType      = "${var.RDGWInstanceType}"

    # Microsoft Active Directory Configuration
    DomainDNSName       = "${var.DomainDNSName}"
    DomainNetBIOSName   = "${var.DomainNetBIOSName}"
    RestoreModePassword = "${var.RestoreModePassword}"
    DomainAdminUser     = "${var.DomainAdminUser}"
    DomainAdminPassword = "${var.DomainAdminPassword}"

    # Microsoft Remote Desktop Gateway Configuration
    NumberOfRDGWHosts = "${var.NumberOfRDGWHosts}"

    # AWS Quick Start Configuration
    QSS3BucketName = "${var.QSS3BucketName}"
    QSS3KeyPrefix  = "${var.QSS3KeyPrefix}"
  }

  template_url = "https://aws-quickstart.s3.amazonaws.com/quickstart-microsoft-activedirectory/templates/ad-master-1.template"
}
