data "aws_eks_cluster" "cluster" {
  name = module.my-cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.my-cluster.cluster_id
}



provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
}

module "my-cluster" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = local.cluster_name
  cluster_version = "1.21"
  subnets         = local.subnets
  vpc_id          = local.vpc_id

  tags = {
    Environment = "Automation Testing"
  }

  worker_groups = [
    {
      name                          = local.worker_group_name
      instance_type                 = local.instance_type
      asg_max_size                  = local.asg_max_size
      asg_min_size                  = local.asg_min_size
      asg_desired_capacity          = local.asg_desired_capacity
      additional_security_group_ids = local.additional_security_group_ids
    }
  ]


  map_users = [
        {
            userarn = "arn:aws:iam::${var.aws_account}:user/${var.username}"
            username = var.username
            groups = ["system:masters"]
        }
    ]


  #cluster_enabled_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}