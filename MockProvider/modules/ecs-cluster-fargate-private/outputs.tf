output "vpc_endpoint_service_primary_mktsvc_service_name" {
  description = "vpc endpoint of primary mktsvc service name"
  value       = aws_vpc_endpoint_service.mktsvc_primary.service_name
}

output "vpc_endpoint_service_secondary_mktsvc_service_name" {
  description = "vpc endpoint of secondary mktsvc service name"
  value       = aws_vpc_endpoint_service.mktsvc_secondary.service_name
}

output "nlb_address" {
  description = "nlb address"
  value       = aws_lb.fargate.dns_name
}