#!/bin/bash

# Create database
echo "CREATE DATABASE IF NOT EXISTS '$DB_NAME';" | mysql

# Create user
echo "CREATE USER IF NOT EXISTS '$DB_USERNAME'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql

# Give user required privileges
echo "GRANT ALL ON '$DB_NAME'.* TO '$DB_USERNAME'@'%';" | mysql

# Reload SQL privileges to update what we did
echo "FLUSH PRIVILEGES;" | mysql

# Run mariaDB in the foreground
exec mysqld