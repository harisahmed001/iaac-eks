locals {
    cluster_name                        = "k8-automate-cluster"
    vpc_id                              = "vpc-c64808a2"
    subnets                             = ["subnet-21dfe257", "subnet-333f0775", "subnet-47898123"]
    worker_group_name                   = "worker-group-1"
    instance_type                       = "t2.small"
    asg_max_size                        = 1
    asg_min_size                        = 1
    asg_desired_capacity                = 1
    additional_security_group_ids       = ["sg-0922919a3e8cd506e"]
}