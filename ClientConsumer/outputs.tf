output "primary_mkt_service_vpc_endpoint_dns_address" {
  description = "primary mkt service vpc endpoint address"
  value       = module.main.primary_mkt_service_vpc_endpoint_dns_address
}
output "secondary_mkt_service_vpc_endpoint_dns_address" {
  description = "secondary mkt service vpc endpoint address"
  value       = module.main.secondary_mkt_service_vpc_endpoint_dns_address
}

output "bastionhost_publicip"{
  value = module.satellite.bastionhost_publicip
}

output "privateAppServer_privateip"{
  value = module.satellite.privateAppServer_privateip
}