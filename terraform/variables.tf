variable "project" {
  type        = string
  description = "Project name used in tags and names."
}
variable "environment" {
  description = "Environment name (dev/stage/prod)"
  type        = string
}



variable "key_pair_name" {
  type        = string
  description = "Existing AWS key pair name for SSH."
  default = "ttn-key01"
}

variable "aws_region" {
  type        = string
  description = "AWS region to deploy to."
  default = "eu-west-3"
 
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDRs."
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones for the subnets."
}
variable "instance_type" {
  type        = string
  description = "EC2 instance type."
  default     = "t3.micro"
}





