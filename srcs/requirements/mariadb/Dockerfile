FROM 	debian:bullseye

EXPOSE 	3306

RUN 	apt update -y &&						\
		apt install mariadb-server -y

# Create the socket folder and set the owner
RUN 	mkdir -p /var/run/mysqld && 			\
		chown -R mysql:root /var/run/mysqld

# Copy the config file
COPY 	tools/50-server.cnf						\
		/etc/mysql/mariadb.conf.d/


# Copy the init script
COPY 	tools/init.sh							\
		./

# Give init script exec permissions
RUN 	chmod +x ./init.sh

ENTRYPOINT [ "./init.sh" ]