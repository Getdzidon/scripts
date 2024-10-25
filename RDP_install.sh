#!/bin/bash

# INSTALATION OF RDP for UBUNTU

# Open Port 3389 (RDP) in the Security Group
# Follow the same process as with the Windows instance: Inbound rule for port 3389 with TCP protocol should allow access from your IP.
# Update the package list:
sudo apt update

# To install XFCE (a lightweight option):
sudo apt install xfce4 xfce4-goodies

# Install XRDP:
sudo apt install xrdp

# Start the XRDP service and enable it to start on boot:
sudo systemctl enable xrdp
sudo systemctl start xrdp

# Configure XRDP to use XFCE:
Open the .xsession file and set XFCE as the default:
echo xfce4-session >~/.xsession


# Set XRDP to allow users:
# Add your user to the ssl-cert group
sudo adduser xrdp ssl-cert

# Allow port 3389 for RDP
sudo ufw allow 3389

# Reboot your instance:
sudo reboot

# After this, copy and paste the Pubic IP of your instance in your Windows RDP App and connect
# For MacBoon users, you might need to copy the Public DNS of the Instance 
