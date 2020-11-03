variable "NumberOfAZs" {
  default = "2"
}

variable "PrivateSubnet1CIDR" {
  default = "10.0.0.0/19"
}

variable "PrivateSubnet2CIDR" {
  default = "10.0.32.0/19"
}

variable "PrivateSubnet3CIDR" {
  default = "10.0.64.0/19"
}

variable "PublicSubnet1CIDR" {
  default = "10.0.128.0/20"
}

variable "PublicSubnet2CIDR" {
  default = "10.0.144.0/20"
}

variable "PublicSubnet3CIDR" {
  default = "10.0.160.0/20"
}

variable "VPCCIDR" {
  default = "10.0.0.0/16"
}

variable "ADServer1InstanceType" {
  default = "t2.medium"
}

variable "ADServer2InstanceType" {
  default = "t2.medium"
}

variable "ADServer1NetBIOSName" {
  default = "FIREHAWKDC1"
}

variable "ADServer2NetBIOSName" {
  default = "FIREHAWKDC2"
}

variable "ADServer1PrivateIP" {
  default = "10.0.0.10"
}

variable "ADServer2PrivateIP" {
  default = "10.0.32.10"
}

variable "RDGWInstanceType" {
  default = "t2.medium"
}

variable "DomainDNSName" {
  default = "firehawkcompute.com"
}

variable "DomainNetBIOSName" {
  default = "FIREHAWKCOMPUTE"
}

variable "NumberOfRDGWHosts" {
  default = "1"
}

variable "QSS3BucketName" {
  default = "aws-quickstart"
}

variable "QSS3KeyPrefix" {
  default = "quickstart-microsoft-activedirectory/"
}
