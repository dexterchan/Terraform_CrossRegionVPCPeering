output "primary_mkt_service_vpc_endpoint_dns_address" {
  description = "primary mkt service vpc endpoint address"
  value       = module.remote.primary_mkt_service_vpc_endpoint_dns_address
}
output "secondary_mkt_service_vpc_endpoint_dns_address" {
  description = "secondary mkt service vpc endpoint address"
  value       = module.remote.secondary_mkt_service_vpc_endpoint_dns_address
}


output "privateAppServer_privateip"{
  value = module.origin.privateAppServer_privateip
}

output "privateAppServer_instanceId"{
  value = module.origin.privateAppServer_instanceId
}

output "remote_subnetids"{
  value = module.remote.subnet_id
}

output "origin_subnetids"{
  value = module.origin.subnet_id
}

output "remote-default-sg_id" {
  value = module.remote.default-sg_id
}

output "origin-default-sg_id" {
  value = module.origin.default-sg_id
}