#!/bin/bash

# Update the package list
sudo apt update

# Install Nginx
sudo apt install nginx -y


# Start nginx webserver
sudo systemctl start nginx

# Enable Nginx to start automatically at boot time
sudo systemctl enable nginx

echo "<html>
<head>
    <title>Welcome to Nginx</title>
</head>
<body>
    <h1>Hello from instance jomacs-lb-instance-2</h1>
</body>
</html>" > /var/www/html/index.nginx-debian.html

# Restart Nginx to apply the changes
systemctl restart nginx
