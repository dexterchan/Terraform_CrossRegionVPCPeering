
resource "aws_vpc_peering_connection" "satellite" {
  peer_vpc_id   = var.client_main_region_vpc_id
  vpc_id        = module.vpc.vpc_id
  peer_region = var.main_region
  auto_accept   = false
  tags = {
    Side = "Requester"
  }
}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "main" {
  provider                  = aws.main
  vpc_peering_connection_id = aws_vpc_peering_connection.satellite.id
  auto_accept               = true

  tags = {
    Side = "Accepter"
  }
}