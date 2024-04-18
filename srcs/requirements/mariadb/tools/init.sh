#!/bin/bash

if [ ! -d /run/mysqld ]; then

	# Create the run folder
	mkdir -p	/run/mysqld

	# Change owner and group
	chown -R	mysql:mysql		/run/mysqld
	chown -R	mysql:mysql		/var/lib/mysql

	# Set root password
	echo "SET PASSWORD = PASSWORD('$DB_ROOT_PASSWORD');"								| mysql

	# Create database
	echo "CREATE DATABASE IF NOT EXISTS '$DB_NAME';"									| mysql

	# Create user
	echo "CREATE USER IF NOT EXISTS '$DB_USERNAME'@'%' IDENTIFIED BY '$DB_PASSWORD';"	| mysql

	# Grant user required privileges
	echo "GRANT ALL ON '$DB_NAME'.* TO '$DB_USERNAME'@'%';"								| mysql

	# Reload SQL privileges to update what we did
	echo "FLUSH PRIVILEGES;"															| mysql
fi

# Run mariaDB in the foreground
exec mysqld