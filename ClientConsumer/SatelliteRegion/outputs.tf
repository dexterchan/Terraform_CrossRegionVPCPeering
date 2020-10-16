output "sat_region_vpc_id" {
  description = "client satellite region vpc id"
  value       = module.vpc.vpc_id
}


output "sat_region_private_route_table_id" {
  description = "client satellite region private route table id"
  value       = module.vpc.private_route_table_ids
}


output "privateAppServer_privateip"{
  value = aws_instance.testprivate.private_ip
}

output "privateAppServer_instanceId"{
  value = aws_instance.testprivate.id
}

output "subnet_id" {
  description = "subnet id"
  value       = module.vpc.private_subnets
}