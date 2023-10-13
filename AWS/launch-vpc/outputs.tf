output "vpc_output_id" {
    value = module.module_vpc.vpc_id
}

output "subnet_public_output_id" {
    value = module.module_subnets.subnet_public_id
  
}