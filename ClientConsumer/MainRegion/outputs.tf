output "primary_mkt_service_vpc_endpoint_dns_address" {
  description = "primary mkt service vpc endpoint address"
  value       = aws_vpc_endpoint.primary_webmkt_service.dns_entry
}

output "secondary_mkt_service_vpc_endpoint_dns_address" {
  description = "secondary mkt service vpc endpoint address"
  value       = aws_vpc_endpoint.secondary_webmkt_service.dns_entry
}

output "main_region_vpc_id" {
  description = "client main region vpc id"
  value       = module.vpc.vpc_id
}

output "main_region_private_route_table_id" {
  description = "client main region private route table id"
  value       = module.vpc.private_route_table_ids
}