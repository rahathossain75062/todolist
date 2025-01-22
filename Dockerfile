## Use Ubuntu as the base image
FROM ubuntu:latest

# Update and install nginx
RUN apt-get update && apt-get install -y nginx && apt-get clean  

# Set the working directory
WORKDIR /var/www/html

# Copy the index.html file to the nginx root directory
COPY index.html .

# Expose port 8090
EXPOSE 8090

# Update the nginx configuration to listen on port 8090
RUN sed -i 's/listen 80 default_server;/listen 8090 default_server;/g' /etc/nginx/sites-available/default && \
    sed -i 's/listen \[::\]:80 default_server;/listen \[::\]:8090 default_server;/g' /etc/nginx/sites-available/default

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
