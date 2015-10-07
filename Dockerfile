FROM php:5.5-apache

# General purpose packages.
RUN apt-get update && apt-get -y install git-core wget php5-gd
# drush: instead of installing a package, pull via composer into /opt/composer
# http://www.whaaat.com/installing-drush-7-using-composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    COMPOSER_HOME=/opt/composer composer --quiet global require drush/drush:dev-master && \
    ln -s /opt/composer/vendor/drush/drush/drush /bin/drush
# Add drush comand https://www.drupal.org/project/registry_rebuild
RUN wget http://ftp.drupal.org/files/projects/registry_rebuild-7.x-2.2.tar.gz && \
    tar xzf registry_rebuild-7.x-2.2.tar.gz && \
    rm registry_rebuild-7.x-2.2.tar.gz && \
    mv registry_rebuild /opt/composer/vendor/drush/drush/commands

# Check drush.
RUN /bin/drush --version

VOLUME ["/var/www/html"]

EXPOSE 80