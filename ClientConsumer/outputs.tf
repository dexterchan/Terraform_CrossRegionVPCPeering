output "primary_mkt_service_vpc_endpoint_dns_address" {
  description = "primary mkt service vpc endpoint address"
  value       = module.main.primary_mkt_service_vpc_endpoint_dns_address
}
output "secondary_mkt_service_vpc_endpoint_dns_address" {
  description = "secondary mkt service vpc endpoint address"
  value       = module.main.secondary_mkt_service_vpc_endpoint_dns_address
}


output "privateAppServer_privateip"{
  value = module.satellite.privateAppServer_privateip
}

output "privateAppServer_instanceId"{
  value = module.satellite.privateAppServer_instanceId
}

output "main_subnetids"{
  value = module.main.subnet_id
}

output "satellite_subnetids"{
  value = module.satellite.subnet_id
}

output "main-default-sg_id" {
  value = module.main.default-sg_id
}

output "satellite-default-sg_id" {
  value = module.satellite.default-sg_id
}