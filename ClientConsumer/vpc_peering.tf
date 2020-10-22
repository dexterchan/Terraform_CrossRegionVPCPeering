
resource "aws_vpc_peering_connection" "origin" {
  provider                  = aws.org
  peer_vpc_id   = module.remote.region_vpc_id
  vpc_id        = module.origin.region_vpc_id
  peer_region = var.remote_region
  auto_accept   = false
  tags = {
    Side = "Requester"
  }
}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "remote" {
  provider                  = aws.remote
  vpc_peering_connection_id = aws_vpc_peering_connection.origin.id
  auto_accept               = true

  tags = {
    Side = "Accepter"
  }
}

data "aws_vpc" "remote" {
  provider  = aws.remote
  id = module.remote.region_vpc_id
}

data "aws_vpc" "origin" {
  provider  = aws.org
  id = module.origin.region_vpc_id
}

#Route table update


resource "aws_route" "origin_route_remote" {
  provider  = aws.org
  for_each  = toset(module.origin.region_private_route_table_id)
  route_table_id            = each.value
  destination_cidr_block    = data.aws_vpc.remote.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.origin.id
  depends_on                = [module.origin]
}

resource "aws_route" "remote_route_origin" {
  provider  = aws.remote
  for_each  = toset(module.remote.region_private_route_table_id)
  route_table_id            = each.value
  destination_cidr_block    = data.aws_vpc.origin.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.origin.id
  depends_on                = [module.origin]
}
