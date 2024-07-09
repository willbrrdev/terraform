module "new-vpc" {
  source         = "./modules/vpc"
  prefix         = var.prefix
  vpc_cidr_block = var.vpc_cidr_block
}

module "eks" {
  source           = "./modules/eks"
  cluster_name     = var.cluster_name
  rentention_days  = var.rentention_days
  desired_capacity = var.desired_capacity
  max_size         = var.max_size
  min_size         = var.min_size
  vpc_id           = module.new-vpc.vpc_id
  subnet_ids       = module.new-vpc.subnet_ids
  prefix           = var.prefix
}

terraform {
  required_version = ">=0.13.1"
  required_providers {
    aws   = ">=3.54.0"
    local = ">=2.1.0"
  }
  backend "s3" {
    bucket = "maestro-tfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
