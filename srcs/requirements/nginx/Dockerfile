FROM	nginx:latest

EXPOSE	443
EXPOSE	80

# Copy the config file
COPY	tools/default.conf				\
		/etc/nginx/conf.d/

# Create the directory for the html files
RUN		mkdir -p	/data/www &&		\
		chown -R	root:root /data/www			

# # Copy the index.html file to the default nginx path
COPY	index.html				\
		/data/www/
