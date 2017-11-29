#!/bin/bash
###### variables ##################
projectdir='/var/www/html'
envfile='/root/.env'

###### functions ##################
function install_bedrock(){
# install bedrock
RUN /usr/bin/composer create-project roots/bedrock ${projectdir} && \
	sed -i -e 's/\/var\/www\/html$/\/var\/www\/html\/web$/' \
		/etc/apache2/sites-enabled/000-default.conf
}
###################################

# check if directory /var/www/html is empty then install bedrock
[[ $(ls -1 ${projectdir} | wc -l ) -gt 0 ]] || install_bedrock

# chack if we need sage if SAGE_INSTALL = 'yes' install sage
if [ ${SAGE_INSTALL} = 'yes' ]; then
    cd ${projectdir}/web/app/themes
    composer create-project roots/sage ${SAGE_THEME_NAME} ${SAGE_VERSION}
fi

# copy .env file to projectdir if it exist
if [ -f ${envfile} ]; then
    cp ${envfile} ${projectdir} ;
fi

# run apache in doreground
/usr/local/bin/apache2-foreground
