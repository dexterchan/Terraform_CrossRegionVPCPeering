output "mkt_service_vpc_endpoint_dns_address" {
  description = "mkt service vpc endpoint address"
  value       = module.main.mkt_service_vpc_endpoint_dns_address
}

output "bastionhost_publicip"{
  value = module.satellite.bastionhost_publicip
}

output "privateAppServer_privateip"{
  value = module.satellite.privateAppServer_privateip
}