FROM centos

MAINTAINER Derek Carr <decarr@redhat.com>

# update, install required, clean
RUN yum -y update && yum install -y httpd php php-devel wget php-pear unzip gcc-c++ make && yum clean all

# update pecl channels
RUN pecl update-channels

# install mongo drivers without Cyrus SASL (MongoDB Enterprise Authentication)
RUN printf "no\n" | pecl install mongo && cd /etc && echo "extension=mongo.so" >> /etc/php.d/mongo.ini

# install RockMongo
RUN cd /root && wget -O rockmongo-1.1.5.zip http://rockmongo.com/downloads/go?id=12 && unzip rockmongo-1.1.5.zip -d /var/www/ && rm -R /var/www/html && mv /var/www/rockmongo/ /var/www/html

# increase php upload size 
RUN sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 10M/g' /etc/php.ini && sed -i 's/post_max_size = 2M/post_max_size = 10M/g' /etc/php.ini

# expose php information
RUN echo '<?php phpInfo(); ?>' > /var/www/html/info.php

# Expose ports
EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]