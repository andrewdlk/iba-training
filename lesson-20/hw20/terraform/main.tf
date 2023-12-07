provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "dav-tf-state"
    key    = "dav-eks-tfstate"
    region = "us-east-1"
  }
}


# data "aws_availability_zones" "available" {
#  state = "available"
#}

locals {
  cluster_name    = "dav-eks-tf"
  cluster_version = "1.28"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.20.0"

  cluster_name    = local.cluster_name
  cluster_version = local.cluster_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  # enable_irsa = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  eks_managed_node_groups = {
    dav-green = {
      name = "dav-node-group1"

      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["t3.medium"]
      #capacity_type  = "SPOT"
      labels = {
        Environment = "dav-green-group"
      }
    }
  }
}

