output "primary_mkt_service_vpc_endpoint_dns_address" {
  description = "primary mkt service vpc endpoint address"
  value       = module.remote.primary_mkt_service_vpc_endpoint_dns_address
}
output "secondary_mkt_service_vpc_endpoint_dns_address" {
  description = "secondary mkt service vpc endpoint address"
  value       = module.remote.secondary_mkt_service_vpc_endpoint_dns_address
}


output "privateAppServer_privateip"{
  value = module.original.privateAppServer_privateip
}

output "privateAppServer_instanceId"{
  value = module.original.privateAppServer_instanceId
}

output "remote_subnetids"{
  value = module.remote.subnet_id
}

output "original_subnetids"{
  value = module.original.subnet_id
}

output "remote-default-sg_id" {
  value = module.remote.default-sg_id
}

output "original-default-sg_id" {
  value = module.original.default-sg_id
}