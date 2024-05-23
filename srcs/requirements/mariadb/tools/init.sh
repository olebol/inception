#!/bin/bash

if [ ! -d /run/mysqld ]; then

	# Create the run folder
	mkdir -p	/run/mysqld

	# Change owner and group
	chown -R	mysql:mysql		/run/mysqld
	chown -R	mysql:mysql		/var/lib/mysql

	mysql_install_db

mysqld --bootstrap << EOF
	SET PASSWORD = PASSWORD('$DB_ROOT_PASSWORD');

	CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;
	CREATE USER IF NOT EXISTS '$DB_USERNAME'@'%' IDENTIFIED BY '$DB_PASSWORD';
	GRANT ALL ON \`$DB_NAME\`.* TO '$DB_USERNAME'@'%';

	FLUSH PRIVILEGES;
EOF

fi

# Run mariaDB in the foreground
exec mysqld