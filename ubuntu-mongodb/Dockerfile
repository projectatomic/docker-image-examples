# Install a more up to date mongodb than what is included in the default ubuntu repositories.

FROM ubuntu
MAINTAINER Clayton Coleman <ccoleman@redhat.com>

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
RUN echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | tee -a /etc/apt/sources.list.d/10gen.list
RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y install mongodb-10gen

RUN mkdir -p /var/lib/mongodb && \
    touch /var/lib/mongodb/.keep && \
    chown -R mongodb:mongodb /var/lib/mongodb

VOLUME ["/var/lib/mongodb"]
USER mongodb

ADD mongodb.conf /etc/mongodb.conf

EXPOSE 27017
CMD ["/usr/bin/mongod", "--config", "/etc/mongodb.conf"]
