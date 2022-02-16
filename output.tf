
###############################################
#  VPC ID                                     #
###############################################
output "vpc_id" {
  value = aws_vpc.vpc_dev.id
}

###############################################
#  ALB DNS NAME                               #
###############################################
output "alb_dns" {
  value = aws_lb.alb01.dns_name
}

###############################################
#  BASTION HOST IP ADDRESS                    #
###############################################
output "bastion_ip" {
  value = aws_instance.bastion.public_ip
}

##################################################
#  DNS record used to direct traffic to the ALB  #
##################################################
output "hostname" {
  value = aws_route53_record.www.name
}

###############################################
#  Cloudfront distribution DNS                #
###############################################
output "cdn_distribution" {
  value = aws_cloudfront_distribution.alb_distribution.domain_name
}

###############################################
#  EFS ID                                     #
###############################################
output "efs_id" {
  value = aws_efs_file_system.wordpress-efs.id
}

###############################################
#  EFS DNS NAME                               #
###############################################
output "efs_dns_name" {
  value = aws_efs_file_system.wordpress-efs.dns_name
}

###############################################
#  RDS ENDPOINT                               #
###############################################
output "aws_db_instance_endpoint" {
  value = aws_db_instance.wordpress_db.endpoint
}
