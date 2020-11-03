variable "AvailabilityZones" {
}
variable "DomainDNSName" {
} 

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
