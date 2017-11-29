# docker-bedrock-sage-yarn
### Overview
    Theis docker-compose LAMP stack with Bedrock and Sage inside.

### Whats inside this stack
    web container:
        Based on official php:7.0-apache image.
	Composer
	Wp-cli
	Bedrock
	Sage theme generator

   database container:
	Mariadb 10.1 official image

### Configure
    I use .env file in working directory.
#### 1 First thing you have to set 
is two variables:
	WP_HOME=http://192.168.1.88
	WP_SITEURL=${WP_HOME}/wp
    Set WP_HOME to your domain name or ip address or you cannt login and setup wordpress.

#### 2 Setup database connection
    This variables you have to set:
MYSQL_ROOT_PASSWORD=sqlrootpass
DB_NAME=dbname
DB_USER=dbuser
DB_PASSWORD=dbpass

    This is optional ( its db container name but you can use your own db server):
DB_HOST=mariadb

#### 3 Set environment. By default development.
WP_ENV=development

#### 4 Also you can generate your salt for Wordpress and set vars in '.env' file. 
    Generate your keys here: https://roots.io/salts.html

#### 5 Put your own code to www directory
    If www directory is empty the start.sh script will install bedrock,
else it will do nothing and by default DocumentRoot is ./www/web in Apache.
You can change directory and other settings in Apache default host config file
    composerbedrocksage/000-default.conf

    If you change something you have to rebuild you containers, just run:
    docker-compose down && docker-compose build && docker-compose up -d

### Sage how to

#### If you need Sage you have to set SAGE_INSTALL to 'yes'.
	DEFAULT: SAGE_INSTALL=yes

#### By default container will install latest stable Sage version
    But you can set your own value for example 8.5.0
	DEFAULT: SAGE_VERSION=

#### Set Sage theme name
	DEFAULT: SAGE_THEME_NAME=sagetheme


### How to run
   docker-compose up -d

### Utilities
   *** WARNING *** IT WILL DELETE ALL in MYSQL WWW FORLDERS.
	Clean your working directory ( where docker-compose.yml ) 
before you make new project. Just run: ./resetalltodefault.sh

