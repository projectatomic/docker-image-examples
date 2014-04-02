FROM fedora:20
MAINTAINER Clayton Coleman <ccoleman@redhat.com>

RUN yum install -y mariadb mariadb-server && yum clean all

RUN mkdir -p /var/log/mysql && \
    touch /var/log/mysql/.keep /var/lib/mysql/.keep && \
    chown -R mysql:mysql /var/log/mysql /var/lib/mysql
VOLUME ["/var/lib/mysql", "/var/log/mysql"]

USER mysql
ADD ./simple.cnf /etc/my.cnf.d/
ADD ./start /usr/bin/run

EXPOSE 3306
CMD ["/usr/bin/run"]