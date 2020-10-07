output "sat_region_vpc_id" {
  description = "client satellite region vpc id"
  value       = module.vpc.vpc_id
}


output "sat_region_private_route_table_id" {
  description = "client satellite region private route table id"
  value       = module.vpc.private_route_table_ids
}