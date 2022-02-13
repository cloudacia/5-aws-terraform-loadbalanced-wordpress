# AWS REGION
variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "US East (N. Virginia)"
}

# AWS VPC CIDR
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = ""
}

# AWS SUBNET #1 IP SUBNET
variable "subnet01" {
  type        = string
  default     = "10.0.1.0/24"
  description = "A public network"
}

# AWS SUBNET #2 IP SUBNET
variable "subnet02" {
  type        = string
  default     = "10.0.2.0/24"
  description = "A private subnet"
}

# AWS SUBNET #3 IP SUBNET
variable "subnet03" {
  type        = string
  default     = "10.0.3.0/24"
  description = "A public subnet"
}

# AWS SUBNET #4 IP SUBNET
variable "subnet04" {
  type        = string
  default     = "10.0.4.0/24"
  description = "A private subnet"
}

# AWS SUBNET #5 IP SUBNET
variable "subnet05" {
  type        = string
  default     = "10.0.5.0/24"
  description = "A private subnet"
}

# AWS SUBNET #5 IP SUBNET
variable "subnet06" {
  type        = string
  default     = "10.0.6.0/24"
  description = "A private subnet"
}

# AWS AVAILABILITY ZONE
variable "availability_zone01" {
  type        = string
  default     = "us-east-1a"
  description = "US East (N. Virginia)"
}

# AWS AVAILABILITY ZONE
variable "availability_zone02" {
  type        = string
  default     = "us-east-1b"
  description = "US East (N. Virginia)"
}

# UBUNTTU 16.04 AMI IMANGE
variable "aws_amis" {
  type    = string
  default = "ami-0affd4508a5d2481b"
}

# AWS INSTANCE TYPE
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

# DEMO DOMAIN NAME
variable "domain_name" {
  type    = string
  default = "cloudacia.net."
}

# SSH PUBLIC KEY
variable "ec2_ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5PcvlG+/CdPKwiGirz0nHFetCcQBv3WGHuJ8ETcOwj4e88I2PAHB+PCB6kEDVJ6gf8E3XDBPV/C1WA4BhrTM+ksj1veroakfcjbC7i2JbwInlDwXCCD48u6dapQxyFf5I0PfB7V31xtDzvwnRatmgyw7huGSskaP36PKsMoEdOCbHt1nBHpzCujb8qSfr4biQiEau7ZPra/8EF+51TdqoprBB0bx+vTVez7hIjK0qv3MgMG1AdtCn4VzpNSgCXTaszJSLi/tOa9nT9rnweZNzQ0BrpfPrHcFqodI/Ec0h5ukaCZvgfX/USj9dSYMTB+24OXdiRKKJsZ+Q2vAAlOHUU1kn2edokOxIvPrbhjo2/5Ma1VgoYUDagdGW0QPudn8Kk5VfuUA2S/cXrZZDKzzsx1VHY9eX+DAd1rDSR1yhoxVXTkYlGyXSclweqSf1WF8GnvK40gHXvLyfBM6Jqh50ASG9yNVGvI0pQG3ZNg+UcbWw8S8cLipdegLEOQuJQmU="
}

# RDS ENGINE
variable "rds_engine" {
  type    = string
  default = "mariadb"
}

# RDS ENGINE VERSION
variable "rds_engine_version" {
  type    = string
  default = "10.5.13"
}

# RDS INSTANCE CLASS
variable "rds_instance_class" {
  type    = string
  default = "db.t3.micro"
}

# RDS DB NAME
variable "rds_db_name" {
  type    = string
  default = "wordpress"
}

# RDS DB USERNAME
variable "rds_db_username" {
  type    = string
  default = "root"
}

# RDS DB USERNAME
variable "rds_db_password" {
  type    = string
  default = "password1234"
}

# HTTPD ROOT DIRECTORY
variable "httpd_root_dir" {
  type    = string
  default = "/var/www/html/wordpress"
}
