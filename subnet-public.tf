resource "aws_subnet" "subnet_public" {
  count             = length(var.public_subnets_cidr)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnets_cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = merge(
    var.common_tags,
    {
      "Name" = "${var.tag_name_prefix}-subnet-public-${count.index}"
    },
  )
}

