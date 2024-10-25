#!/bin/bash

# SET UP ELK Stack
# Recommended Instances:
	# - t2.large - 8GiB RAM
	# - t2.xlarge - 16GiB RAM
	# - t2.2xlarge - 32GiB RAM
# Video Link to set up ELK: https://youtu.be/XVRv1W3n94Y?si=EjYpQlFiAJiUextW
# Practice Environment: https://demo.elastic.co/app/home#/

# Setting Up Environment ##### (both the server and the host)
sudo apt update	
sudo apt upgrade -y
sudo apt install apt-transport-https
sudo apt install openjdk-11-jdk -y
java -version
sudo nano /etc/environment
# Add Text: JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"


source /etc/environment
echo $JAVA_HOME
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic.list
sudo apt-get update

# Install Elasticsearch
sudo apt-get install elasticsearch
sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch
sudo systemctl status elasticsearch
sudo nano /etc/elasticsearch/elasticsearch.yml
		# Find the network.host setting, uncomment it, and set it to 0.0.0.0 to bind to all available IP addresses and uncomment the discovery section to specify the initial nodes for cluster formation discovery.seed_hosts: []
		# Set xpack.security.enabled: false
sudo systemctl restart elasticsearch
curl -X GET "localhost:9200"

# Install Logstash
sudo apt-get install logstash -y
sudo systemctl start logstash
sudo systemctl enable logstash
sudo systemctl status logstash

# Install Kibana
sudo apt-get install kibana
sudo systemctl start kibana
sudo systemctl enable kibana
sudo systemctl status kibana
sudo nano /etc/kibana/kibana.yml

# Uncomment and adjust the following lines to bind Kibana to all IP addresses and connect it to Elasticsearch.
		# server.port: 5601
		# server.host: "0.0.0.0"
		# elasticsearch.hosts: ["http://localhost:9200"]

sudo systemctl restart kibana

# Install Filebeat ##### (both the server and the host)
sudo apt-get install filebeat
sudo nano /etc/filebeat/filebeat.yml

# In the Elasticsearch Output section,
		# Comment:
		# output.elasticsearch:
		# Array of hosts to connect to.
		# hosts: ["localhost:9200"]
		# output.elasticsearch:
		# Array of hosts to connect to.
		#  hosts: ["localhost:9200"]
# In the Logstash Output section
		# Uncomment:
		# output.logstash:
		# The Logstash hosts
		# hosts: ["localhost:5044"]

#output.logstash:
		  # The Logstash hosts
		  # hosts: ["localhost:5044"]
sudo filebeat modules enable system
sudo filebeat setup --index-management -E output.logstash.enabled=false -E output.elasticsearch.hosts=["0.0.0.0:9200"]
sudo systemctl start filebeat
sudo systemctl enable filebeat
curl -XGET "localhost:9200/_cat/indices?v"
