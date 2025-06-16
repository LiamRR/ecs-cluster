region = "eu-west-2"

# ----------------
# Staging VPC VARS
# ----------------
# Environment name, used for tagging resources
env = "staging"
# Main subnet, we'll use /26's for private subnets
cidr_block = "172.16.1.0/24"
# Availability zones for both subnets
az_pri = "eu-west-2a"
az_sec = "eu-west-2b"
# Allowed CIDR blocks for the security group
cidr_blocks = ["81.101.229.40/32"]

# -----------
# Staging ECR
# -----------
# Main project name for staging env
proj_name   = "lumon"
mutability  = "MUTABLE"
environment = "staging"
# List of repos to be created for the project
ecr_repositories = [
  "frontend",
]
