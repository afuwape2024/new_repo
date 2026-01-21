variable "detroit_vpc_cidr_block" {}
variable "detroit_vpc_public_subnet_cidr_block" {} 
variable "detroit_vpc_private_subnet_cidr_block" {}
variable "detroit_vpc_availability_zone_2a" {}
variable "detroit_vpc_availability_zone_2b" {}
variable "detroit_vpc_public2_subnet_cidr_block" {}
variable "detroit_vpc_private2_subnet_cidr_block" {}

variable "detroit_vpc" {
  default = "detroit_vpc"
}
variable "detroit_vpc_public_subnet" {
  default = "detroit_vpc_public_subnet"
}
variable "detroit_vpc_private_subnet" {
  default = "detroit_vpc_private_subnet"
}
variable "detroit_vpc_public2_subnet" {
  default = "detroit_vpc_public2_subnet"
}
variable "detroit_vpc_private2_subnet" {
  default = "detroit_vpc_private2_subnet"
}



#================================================
#============================================================================
# Variables for Chicago VPC

variable "chicago_vpc_cidr_block" {}
variable "chicago_vpc_public_subnet_cidr_block" {} 
variable "chicago_vpc_private_subnet_cidr_block" {}
variable "chicago_vpc_availability_zone_2a" {}
variable "chicago_vpc_availability_zone_2b" {}
variable "chicago_vpc_public2_subnet_cidr_block" {}
variable "chicago_vpc_private2_subnet_cidr_block" {}

variable "chicago_vpc" {
  default = "chicago_vpc"
}
variable "chicago_vpc_public_subnet" {
  default = "chicago_vpc_public_subnet"
}
variable "chicago_vpc_private_subnet" {
  default = "chicago_vpc_private_subnet"
}
variable "chicago_vpc_public2_subnet" {
  default = "chicago_vpc_public2_subnet"
}
variable "chicago_vpc_private2_subnet" {
  default = "chicago_vpc_private2_subnet"
}
