
resource "aws_vpc_peering_connection" "satellite" {
  provider                  = aws.sat
  peer_vpc_id   = module.main.main_region_vpc_id
  vpc_id        = module.satellite.sat_region_vpc_id
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

data "aws_vpc" "main" {
  provider  = aws.main
  id = module.main.main_region_vpc_id
}

data "aws_vpc" "satellite" {
  provider  = aws.sat
  id = module.satellite.sat_region_vpc_id
}

#Route table update
resource "aws_route" "satellite_route_main0" {
  provider  = aws.sat
  route_table_id            = module.satellite.sat_region_private_route_table_id[0]
  destination_cidr_block    = data.aws_vpc.main.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.satellite.id
  depends_on                = [module.satellite]
}

resource "aws_route" "satellite_route_main1" {
  provider  = aws.sat
  route_table_id            = module.satellite.sat_region_private_route_table_id[1]
  destination_cidr_block    = data.aws_vpc.main.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.satellite.id
  depends_on                = [module.satellite]
}

resource "aws_route" "main_route_satellite0" {
  provider  = aws.main
  route_table_id            = module.main.main_region_private_route_table_id[0]
  destination_cidr_block    = data.aws_vpc.satellite.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.satellite.id
  depends_on                = [module.satellite]
}

resource "aws_route" "main_route_satellite1" {
  provider  = aws.main
  route_table_id            = module.main.main_region_private_route_table_id[1]
  destination_cidr_block    = data.aws_vpc.satellite.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.satellite.id
  depends_on                = [module.satellite]
}