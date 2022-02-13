#!/bin/bash

# Disable SELinux
sudo setenforce 0

# Install Apache Web Server
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd

# Add EPEL and REMI Repository
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm

# Install PHP 7.4 on CentOS 7
sudo yum -y install yum-utils
sudo yum-config-manager --enable remi-php74
sudo yum-config-manager --enable remi-php74
sudo yum install php php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json -y

# Install AWS CLI
sudo yum install awscli -y

# Get instanace hostname
EC2_HOSTNAME=$(curl -s http://169.254.169.254/latest/meta-data/hostname)

# Saving string into a file (index.html)
echo "<h1>Hello World from "$EC2_HOSTNAME"</h1>" > /var/www/html/index.html

# Create directory for Wordpress
sudo mkdir /var/www/html/website

# Mount EFS into the local filesystem
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport "${file_system_dns}:/" /var/www/html/website

# Change owner to files
sudo chown apache:apache -R /var/www/html/website/wordpress

# Copy http.conf to /etc/httpd/conf
sudo aws s3 cp s3://cloudacia-apache-conf/httpd.conf /etc/httpd/conf/

# Restarting Apache
sudo systemctl restart httpd
