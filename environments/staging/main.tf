module "vpc" {
  source      = "../../modules/vpc"
  env         = var.env
  cidr_block  = var.cidr_block
  az_pri      = var.az_pri
  az_sec      = var.az_sec
  cidr_blocks = var.cidr_blocks
}

module "ecr" {
  source = "../../modules/ecr"

  proj_name    = var.proj_name
  mutability   = var.mutability
  environment  = var.environment
  repositories = var.ecr_repositories
}
