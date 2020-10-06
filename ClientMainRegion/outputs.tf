output "mkt_service_vpc_endpoint_dns_address" {
  description = "mkt service vpc endpoint address"
  value       = aws_vpc_endpoint.webmkt_service.dns_entry
}

output "main_region_vpc_id" {
  description = "client main region vpc id"
  value       = module.vpc.vpc_id
}