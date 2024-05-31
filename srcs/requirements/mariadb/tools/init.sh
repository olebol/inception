#!/bin/bash

if [ ! -d /run/mysqld ]; then

	# Create the run folder
	mkdir -p	/run/mysqld

	# Change owner and group
	chown -R	mysql:mysql		/run/mysqld
	chown -R	mysql:mysql		/var/lib/mysql

	mysql_install_db

	service mariadb start;

	mysql -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"
	mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
	mysql -e "GRANT ALL ON \`$DB_NAME\`.* TO '$DB_USER'@'%';"
	mysql -e "FLUSH PRIVILEGES;"

	service mariadb stop;

fi

# Run mariaDB in the foreground
exec mysqld