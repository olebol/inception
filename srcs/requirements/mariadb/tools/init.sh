#!/bin/bash

{
	# Create database
	echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

	# Create user
	echo "CREATE USER IF NOT EXISTS $DB_USER@'%' IDENTIFIED BY '$DB_PASSWORD';"

	# Give user required privileges
	echo "GRANT ALL ON $DB_NAME.* TO $DB_USER@'%';"

	# Reload SQL privileges to update what we did
	echo "FLUSH PRIVILEGES;"
} | mysql

# Run mariaDB in the foreground
echo "Running MariaDB"
exec mysqld