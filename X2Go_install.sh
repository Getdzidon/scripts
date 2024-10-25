#!/bin/bash

# X2Go - Fast and Secure Remote Desktop for Ubuntu
# X2Go is a great alternative to RDP for connecting to Linux systems with a graphical interface. It is # optimized for low bandwidth and offers a smoother experience than traditional RDP.

# Steps to Connect Using X2Go:

# 1. Install a Desktop Environment (e.g., XFCE)
# SSH into your Ubuntu EC2 instance:
# ssh -i ~/.ssh/your-key.pem ubuntu@your-ec2-public-ip
# Update the package list and install XFCE (a lightweight desktop environment):
sudo apt update
sudo apt install xfce4 xfce4-goodies

# 2. Install X2Go Server on Your EC2 Instance
# Install the X2Go server package:
sudo apt install x2goserver x2goserver-xsession

# 3. Download and Install X2Go Client on Your Local Machine
# Download the X2Go client for your Mac or Windows from the official X2Go website.

# 4. Open X2Go Client and Configure the Connection
# After installation, open the X2Go client on your local machine.
# Click on "New Session" and configure the following:
# Host: Your EC2 instance's public IP.
# Login: Your Ubuntu username (ubuntu).
# SSH Key: Point to your .pem file for key-based authentication.
# Session Type: Choose XFCE from the dropdown menu.

# 5. Connect to the Ubuntu EC2 Instance
# Click the session you just created and start the connection.
# You should now have a graphical desktop environment running on your EC2 instance via X2Go.
