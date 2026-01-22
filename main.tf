#create module for detriot_vpc
#detroit_vpc/main.tf

module "detriot_vpc" {
  source = "./1detroit_vpc"
  detroit_vpc_cidr_block                = var.detroit_vpc_cidr_block
  detroit_vpc_public_subnet_cidr_block  = var.detroit_vpc_public_subnet_cidr_block
  detroit_vpc_private_subnet_cidr_block = var.detroit_vpc_private_subnet_cidr_block
  detroit_vpc_availability_zone_2a      = var.detroit_vpc_availability_zone_2a
  detroit_vpc_availability_zone_2b      = var.detroit_vpc_availability_zone_2b
  detroit_vpc_public2_subnet_cidr_block = var.detroit_vpc_public2_subnet_cidr_block
  detroit_vpc_private2_subnet_cidr_block = var.detroit_vpc_private2_subnet_cidr_block

}

module "chicago_vpc" {
  source = "./2chicago_vpc"
  chicago_vpc_cidr_block                = var.chicago_vpc_cidr_block
  chicago_vpc_public_subnet_cidr_block  = var.chicago_vpc_public_subnet_cidr_block
  chicago_vpc_private_subnet_cidr_block = var.chicago_vpc_private_subnet_cidr_block
  chicago_vpc_availability_zone_2a      = var.chicago_vpc_availability_zone_2a
  chicago_vpc_availability_zone_2b      = var.chicago_vpc_availability_zone_2b
  chicago_vpc_public2_subnet_cidr_block = var.chicago_vpc_public2_subnet_cidr_block
  chicago_vpc_private2_subnet_cidr_block = var.chicago_vpc_private2_subnet_cidr_block
}

module "internet_gateway" {
  source = "./3ig"
  chicago_vpc = module.chicago_vpc.chicago_vpc
  detroit_vpc = module.detriot_vpc.detroit_vpc
}

module "route_table" {
  source = "./4routetable"
  detroit_vpc = module.detriot_vpc.detroit_vpc
  detroit_vpc_public_subnet = module.detriot_vpc.detroit_vpc_public_subnet
  detroit_vpc_private_subnet = module.detriot_vpc.detroit_vpc_private_subnet
  detroit_vpc_public2_subnet = module.detriot_vpc.detroit_vpc_public2_subnet
  detroit_vpc_private2_subnet = module.detriot_vpc.detroit_vpc_private2_subnet  
  chicago_vpc = module.chicago_vpc.chicago_vpc
  chicago_vpc_public_subnet = module.chicago_vpc.chicago_vpc_public_subnet
  chicago_vpc_private_subnet = module.chicago_vpc.chicago_vpc_private_subnet
  chicago_vpc_public2_subnet = module.chicago_vpc.chicago_vpc_public2_subnet
  chicago_vpc_private2_subnet = module.chicago_vpc.chicago_vpc_private2_subnet  
  detroit_vpc_igw = module.internet_gateway.detroit_vpc_igw
  chicago_vpc_igw = module.internet_gateway.chicago_vpc_igw   
}

module "network_acl" {
  source = "./5nacl"
  detroit_vpc = module.detriot_vpc.detroit_vpc
  detroit_vpc_public_subnet = module.detriot_vpc.detroit_vpc_public_subnet
  detroit_vpc_private_subnet = module.detriot_vpc.detroit_vpc_private_subnet
  detroit_vpc_public2_subnet = module.detriot_vpc.detroit_vpc_public2_subnet
  detroit_vpc_private2_subnet = module.detriot_vpc.detroit_vpc_private2_subnet  
  chicago_vpc = module.chicago_vpc.chicago_vpc
  chicago_vpc_public_subnet = module.chicago_vpc.chicago_vpc_public_subnet
  chicago_vpc_private_subnet = module.chicago_vpc.chicago_vpc_private_subnet
  chicago_vpc_public2_subnet = module.chicago_vpc.chicago_vpc_public2_subnet
  chicago_vpc_private2_subnet = module.chicago_vpc.chicago_vpc_private2_subnet  
  detroit_vpc_igw = module.internet_gateway.detroit_vpc_igw
  chicago_vpc_igw = module.internet_gateway.chicago_vpc_igw   
} 

module "security_group" {
  source = "./6securitygroup"
  detroit_vpc = module.detriot_vpc.detroit_vpc
  detroit_vpc_public_subnet = module.detriot_vpc.detroit_vpc_public_subnet
  detroit_vpc_private_subnet = module.detriot_vpc.detroit_vpc_private_subnet
  detroit_vpc_public2_subnet = module.detriot_vpc.detroit_vpc_public2_subnet
  detroit_vpc_private2_subnet = module.detriot_vpc.detroit_vpc_private2_subnet  
  chicago_vpc = module.chicago_vpc.chicago_vpc
  chicago_vpc_public_subnet = module.chicago_vpc.chicago_vpc_public_subnet
  chicago_vpc_private_subnet = module.chicago_vpc.chicago_vpc_private_subnet
  chicago_vpc_public2_subnet = module.chicago_vpc.chicago_vpc_public2_subnet
  chicago_vpc_private2_subnet = module.chicago_vpc.chicago_vpc_private2_subnet  
  detroit_vpc_igw = module.internet_gateway.detroit_vpc_igw
  chicago_vpc_igw = module.internet_gateway.chicago_vpc_igw

}
