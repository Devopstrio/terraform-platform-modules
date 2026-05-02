terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "platform_eks" {
  source = "../../modules/kubernetes"

  cluster_name = "dev-platform-cluster"
  subnet_ids   = ["subnet-123", "subnet-456"] # Mock subnets
}

module "platform_registry" {
  source = "../../modules/registry"

  registry_name = "dev-platform-registry"
}

module "platform_api" {
  source = "../../modules/api-gateway"

  api_name = "dev-platform-gateway"
}

module "platform_lake" {
  source = "../../modules/data-lake"

  lake_name = "dev-platform-data-lake-devopstrio"
}
