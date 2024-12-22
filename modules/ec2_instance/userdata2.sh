#!/bin/bash
apt update
apt install -y apache2

# Create a simple HTML file with the portfolio content and display the images
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Server 2</title>
</head>
<body>
  <h1>Welcome to Server 2</h1>
  <img src="https://<bucket name>.s3.amazonaws.com/images/architecture.jpeg" alt="Image from S3" width=800 height=700>
</body>
</html>
EOF

# Start Apache and enable it on boot
systemctl start apache2
systemctl enable apache2