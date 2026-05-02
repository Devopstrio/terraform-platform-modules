variable "registry_name" {
  description = "Name of the ECR repository"
  type        = string
}

resource "aws_ecr_repository" "this" {
  name                 = var.registry_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "registry_url" {
  value = aws_ecr_repository.this.repository_url
}
