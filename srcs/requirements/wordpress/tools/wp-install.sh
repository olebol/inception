#!/bin/bash

# Set the working directory
cd /var/www/html

# Install WordPress
if [ -f wp-login.php ]
then
	echo "WordPress is already installed"
else
	echo "Downloading WordPress..."
	wp core download							\
			--path="/var/www/html"				\
			--allow-root
fi

# Create wp-config.php
if [ -f wp-config.php ]
then
	echo "Wordpress is already configured"
else
	echo "Configuring WordPress..."
	wp config create 							\
			--path="/var/www/html"				\
			--dbname=$DB_NAME					\
			--dbuser=$DB_USER					\
			--dbpass=$DB_PASS					\
			--dbhost=$DB_HOST					\
			--allow-root
fi

# Install WordPress
echo "Installing WordPress..."
wp core install 							\
		--path="/var/www/html"				\
		--url=$WP_HTTPS_URL					\
		--title=$WP_TITLE					\
		--admin_user=$WP_ADMIN_USER			\
		--admin_password=$WP_ADMIN_PASS		\
		--admin_email=$WP_ADMIN_MAIL		\
		--skip-email						\
		--allow-root						

echo "executing php-fpm7.4..."
exec php-fpm7.4 -F -R