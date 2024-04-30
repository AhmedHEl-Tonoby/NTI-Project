resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  enable_dns_support = true

  enable_dns_hostnames = true

  # enable_classsiclink              = false

  #   enable_classsiclink_dns_support  = false

  #   assign_generated_ip6_cider_block = false

  tags = {
    Name = "EKS-VPC"
  }
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "vpc id"
  sensitive   = false
}
