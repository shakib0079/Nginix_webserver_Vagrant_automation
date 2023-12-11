#!/bin/bash
# Define variables
websiteURL="https://www.tooplate.com/zip-templates/2134_gotto_job.zip"
nginxDIR="/usr/share/nginx/html"
tempDIR="/tmp/website_temp/2134_gotto_job"
# Installing Dependency 
sudo yum update -y
sudo yum install nginx wget zip unzip -y
# Create a temporary directory
sudo mkdir -p $tempDIR
# Download the website zip file
sudo wget -P $tempDIR $websiteURL
# Unzip the website contents
sudo unzip $tempDIR/*.zip -d $tempDIR
# Remove the downloaded zip file
sudo rm $tempDIR/*.zip
# Remove default Nginx index.html if exists
sudo rm $nginxDIR/index.html
# Move website files to Nginx webroot
sudo mv $tempDIR/* $nginxDIR
# Set proper permissions
sudo chown -R nginx:nginx $nginxDIR
# Restart Nginx to apply changes
sudo systemctl restart nginx
# Clean up temporary directory
sudo rm -r $tempDIR
sudo echo "Website deployed successfully!"
