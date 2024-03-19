FROM	debian:oldstable

EXPOSE	443

# Install nginx
RUN 	apt update -y &&				\
		apt install -y nginx

# Copy the config file
COPY 	tools/default.conf				\
		/etc/nginx/conf.d/

# Create the directory for the html files
RUN 	mkdir -p /data/www &&			\
		chown -R root:root /data/www

# # Copy the index.html file to the default nginx path
COPY 	index.html						\
		/data/www/

CMD 	[ "nginx", "-g", "daemon off;" ]