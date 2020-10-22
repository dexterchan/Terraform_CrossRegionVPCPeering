
resource "aws_vpc_peering_connection" "original" {
  provider                  = aws.org
  peer_vpc_id   = module.remote.region_vpc_id
  vpc_id        = module.original.region_vpc_id
  peer_region = var.remote_region
  auto_accept   = false
  tags = {
    Side = "Requester"
  }
}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "remote" {
  provider                  = aws.remote
  vpc_peering_connection_id = aws_vpc_peering_connection.original.id
  auto_accept               = true

  tags = {
    Side = "Accepter"
  }
}

data "aws_vpc" "remote" {
  provider  = aws.remote
  id = module.remote.region_vpc_id
}

data "aws_vpc" "original" {
  provider  = aws.org
  id = module.original.region_vpc_id
}

#Route table update


resource "aws_route" "original_route_remote" {
  provider  = aws.org
  for_each  = toset(module.original.region_private_route_table_id)
  route_table_id            = each.value
  destination_cidr_block    = data.aws_vpc.remote.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.original.id
  depends_on                = [module.original]
}

resource "aws_route" "remote_route_original" {
  provider  = aws.remote
  for_each  = toset(module.remote.region_private_route_table_id)
  route_table_id            = each.value
  destination_cidr_block    = data.aws_vpc.original.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.original.id
  depends_on                = [module.original]
}
