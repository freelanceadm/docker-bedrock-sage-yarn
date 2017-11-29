FROM php:7.0-apache
MAINTAINER Anatoli Kartashov freelanceadm@gmail.com
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		wget \
		git \
		zip unzip \
	&& rm -rf /var/lib/apt/lists/*

# install composer
RUN cd /tmp && \
	wget http://getcomposer.org/installer && \
	php installer --install-dir=/usr/bin --filename=composer

# install wp-cli
RUN cd /tmp && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/bin/wp

# install bedrock
RUN /usr/bin/composer create-project roots/bedrock /var/www/html && \
	sed -i -e 's/\/var\/www\/html$/\/var\/www\/html\/web$/' \
		/etc/apache2/sites-enabled/000-default.conf
COPY start.sh /root/start.sh
CMD ["/root/start.sh"]
