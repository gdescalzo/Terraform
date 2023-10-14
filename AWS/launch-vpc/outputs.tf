output "vpc_output_id" {
    value = module.module_vpc.vpc_id
}

output "subnet_public_output_id" {
    value = module.module_subnets.subnet_public_id
  
}

output "igw_id_output" {
    value = module.module_igw.igw_id  
}

output "routing_table_public_output" {
    value = module.module_routing_table.routing_table_public_output
}