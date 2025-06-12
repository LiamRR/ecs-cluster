resource "aws_ecr_repository" "repositories" {
  for_each = toset(var.repositories)

  name                 = "${var.proj_name}-${each.value}"
  image_tag_mutability = var.mutability

  tags = {
    Name        = "${var.proj_name}-${each.value}"
    Environment = var.environment
    Project     = var.proj_name
  }
}

resource "aws_ecr_lifecycle_policy" "repositories" {
  for_each   = aws_ecr_repository.repositories
  repository = each.value.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep last 10 images"
        selection = {
          tagStatus     = "tagged"
          tagPrefixList = ["v"]
          countType     = "imageCountMoreThan"
          countNumber   = 10
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}
