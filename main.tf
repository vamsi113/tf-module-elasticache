resource "aws_elasticache_cluster" "main" {
  cluster_id           = "${var.env}-${var.name}-elasticache"
  engine               = var.engine
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = aws_elasticache_parameter_group.default.name
  engine_version       = var.engine_version
 # port                 = var.port
}

resource "aws_elasticache_parameter_group" "default" {
  name   = "${var.env}-${var.name}-elasticache"
  family = "redis6.x"

}

resource "aws_elasticache_subnet_group" "default" {
  name       = "${var.env}-${var.name}-elasticache"
  subnet_ids = var.subnets
}