#!/bin/bash

###############################################
# Disable SELinux                             #
###############################################
function DisableSELinux(){
  sudo setenforce 0
}

###############################################
# Install Apache Web Server                   #
###############################################
function InstallApache(){
  sudo yum install httpd -y
  sudo systemctl enable httpd
  sudo systemctl start httpd
}

###############################################
# Add EPEL and REMI Repository                #
###############################################
function InstallPHPRepos(){
  epel_repo="https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm"
  remi_repo="https://rpms.remirepo.net/enterprise/remi-release-7.rpm"
  sudo yum -y install "$epel_repo"
  sudo yum -y install "$remi_repo"
}

###############################################
# Install PHP 7.4 on CentOS 7                 #
###############################################
function InstallPHP(){
  php_package="remi-php74"
  sudo yum -y install yum-utils
  sudo yum-config-manager --enable "$php_package"
  sudo yum install php php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json -y
}

###############################################
# Install AWS CLI                             #
###############################################
function InstallAWSCLI(){
  sudo yum install awscli -y
}

###############################################
# DECLARING VARIABLES                         #
###############################################
function SetEnVar(){
  localhost="http://169.254.169.254/latest/meta-data/hostname"
  index_page="/var/www/html/index.html"
  # Get instanace hostname
  EC2_HOSTNAME=$(curl -s "$localhost")
  # Saving string into a file (index.html)
  echo "<h1>Hello World from "$EC2_HOSTNAME"</h1>" > "$index_page"
}

###############################################
# Mount EFS into the local filesystem         #
###############################################
function MountEFS(){
  efs_path="/var/www/html/website"
  sudo mkdir "$efs_path"
  sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport "${file_system_dns}:/" "$efs_path"
}

###############################################
# Change owner to files                       #
###############################################
function SetWPPermissons(){
  wordpress_path="/var/www/html/website/wordpress"
  sudo chown apache:apache -R "$wordpress_path"
}

###############################################
# Copy http.conf to /etc/httpd/conf           #
###############################################
function CopyWPConf(){
  s3_bucket="cloudacia-apache-conf"
  s3_key="httpd.conf"
  apache_conf="/etc/httpd/conf"
  sudo aws s3 cp s3://"$s3_bucket"/"$s3_key" "$apache_conf"
}

###############################################
# Restarting Apache                           #
###############################################
function RestartApache(){
  sudo systemctl restart httpd
}

##################
# Script worflow #
##################

DisableSELinux
InstallApache
InstallPHPRepos
InstallPHP
InstallAWSCLI
SetEnVar
MountEFS
SetWPPermissons
CopyWPConf
RestartApache
