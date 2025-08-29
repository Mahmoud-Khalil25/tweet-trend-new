project      = "tweet-trend"
environment  = "prod"
aws_region   = "eu-west-3"

vpc_cidr       = "10.0.0.0/16"
public_subnets = ["10.0.0.0/19", "10.0.32.0/19"]
azs            = ["eu-west-3a", "eu-west-3b"]
key_pair_name    = "ttn-key01"