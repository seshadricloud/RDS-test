# #!/bin/bash

# # Install PHP and necessary dependencies
# sudo amazon-linux-extras install php7.4 -y
# sudo yum install httpd php php-mysql -y

# # Start and enable Apache web server
# sudo systemctl start httpd
# sudo systemctl enable httpd

# # Additional setup commands for PHP
# # For example, creating a directory for your PHP app
# sudo mkdir /path/to/your/php/app
# sudo chown ec2-user:ec2-user /path/to/your/php/app
# cd /path/to/your/php/app

# # Clone your PHP app repository (replace with your actual repository URL)
# sudo git clone https://github.com/yourusername/your-php-app.git .

# # Install additional PHP packages if needed
# # sudo composer install  # Uncomment if you use Composer for dependency management

# # Restart Apache to apply changes
# sudo systemctl restart httpd

#