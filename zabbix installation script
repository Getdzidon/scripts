#!/bin/bash

# ZABBIX INSTALATION
# Become root user
# Start new shell session with root privileges.

sudo -s

# Install Zabbix repository
# Documentation
wget https://repo.zabbix.com/zabbix/7.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_7.0-2+ubuntu24.04_all.deb
dpkg -i zabbix-release_7.0-2+ubuntu24.04_all.deb
apt update

# Install Zabbix server, frontend, agent
apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent

# Create initial Database:
# Before we move to the next step we will have to download and enable. mysql server on our machine. The steps for the same are as-
sudo apt update
sudo apt install mysql-server
sudo systemctl start mysql
sudo systemctl enable mysql


# Create initial database
# Documentation
# Make sure you have database server up and running.

#.................................................................................................
# Run the following on your database host.
mysql -uroot -p
password
mysql> create database zabbix character set utf8mb4 collate utf8mb4_bin;
mysql> create user zabbix@localhost identified by 'password';
mysql> grant all privileges on zabbix.* to zabbix@localhost;
mysql> set global log_bin_trust_function_creators = 1;
mysql> quit;

# On Zabbix server host import initial schema and data. You will be prompted to enter your newly created password.
zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p zabbix

#.................................................................................................

# Disable log_bin_trust_function_creators option after importing database schema.
mysql -uroot -p
password
mysql> set global log_bin_trust_function_creators = 0;
mysql> quit;

# Configure the database for Zabbix server
# Edit file /etc/zabbix/zabbix_server.conf
DBPassword=password

# Start Zabbix server and agent processes
# Start Zabbix server and agent processes and make it start at system boot.
systemctl restart zabbix-server zabbix-agent apache2
systemctl enable zabbix-server zabbix-agent apache2

# Open Zabbix UI web page
# The default URL for Zabbix UI when using Apache web server is http://host-public-ip/zabbix
# Default Username: Admin
# Default Password: zabbix
# Change the default password for security reasons.
