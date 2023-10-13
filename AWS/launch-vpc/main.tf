provider "aws" {
    region  = var.aws_region
}

module "module_vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_name = var.vpc_name  
}

module "module_subnets" {
  source = "./modules/subnets"
  vpc_id = module.module_vpc.vpc_id

  # Public Subnet
  subnet_public_name = var.subnet_public_name
  subnet_public_cidr = var.subnet_public_cidr
  az_subnet_public = var.az_subnet_public

  #Private Subnet
  subnet_private_name = var.subnet_private_name
  subnet_private_cidr = var.subnet_private_cidr
  az_subnet_private = var.az_subnet_privated
}

module "module_igw" {
  source = "./modules/igw"
  vpc_id = module.module_vpc.vpc_id
  igw_name = var.igw_name
}