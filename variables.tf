variable "region" {
  description = "AWS region"
  default     = "us-east-2"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "profile" {
  description = "AWS profile"
  default = "tfdev"
}

variable "instance_name" {
  description = "EC2 instance name"
  default     = "tftest1"
}

variable "vpc_id" {
  description = "EC2 instance name"
  default     = "vpc-01dc59fa37b29e71d"
}

