module "vpc" {
  source      = "../../modules/vpc"
  env         = var.env
  cidr_block  = var.cidr_block
  az_pri      = var.az_pri
  az_sec      = var.az_sec
  cidr_blocks = var.cidr_blocks
}
