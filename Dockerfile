# Use Ubuntu as the base image
FROM ubuntu:latest

# Update and install nginx
RUN apt-get update && apt-get install -y nginx && apt-get clean

# Set the working directory
WORKDIR /var/www/todo

# Copy the index.html file to the nginx root directory
COPY index.html .

# Expose port 8090
EXPOSE 8090

# Replace the default nginx configuration to listen on port 8080
RUN sed -i 's/listen 80;/listen 8090;/g' /etc/nginx/sites-available/default

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
