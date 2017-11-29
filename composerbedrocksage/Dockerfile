FROM php:7.0-apache
MAINTAINER Anatoli Kartashov freelanceadm@gmail.com
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		wget \
		git \
		zip unzip && \
        docker-php-ext-install mysqli \
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
RUN /usr/bin/composer create-project roots/bedrock /var/www/html

# add default vhost config for apache
COPY 000-default.conf /etc/apache2/sites-available

# add main startup script to container
COPY start.sh /root/start.sh
CMD ["/root/start.sh"]
