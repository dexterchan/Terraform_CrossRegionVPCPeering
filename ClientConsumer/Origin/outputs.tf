output "region_vpc_id" {
  description = "client satellite region vpc id"
  value       = module.vpc.vpc_id
}


output "region_private_route_table_id" {
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

output "default-sg_id" {
  description = "security group id of application"
  value = module.vpc.default_security_group_id
}