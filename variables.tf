variable "region" {
  default = "eu-north-1"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  default = ["eu-north-1a", "eu-north-1b"]
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ami_id" {
  default = "ami-042b4708b1d05f512"
}

variable "key_name" {
  default = "ec2-cred"
}

variable "user_data_scripts" {
  description = "List of user data scripts for each instance."
  type        = list(string)
  default     = ["userdata1.sh", "userdata2.sh"]
}