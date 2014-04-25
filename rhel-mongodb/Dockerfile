FROM 10.64.27.125:5000/vpavlin/rhel7
# FROM 10.64.27.125:5000/rhel:7-0.0.1.beta.el7
MAINTAINER scollier <scollier@redhat.com>

# Update the container and clean cache
RUN yum -y update; yum clean all

# Add repo files
ADD ./mongo.repo /etc/yum.repos.d/

# Install MongoDB packages and extras
RUN yum -y install mongo-10gen-server mongo-10gen; yum clean all
RUN yum -y install procps-ng iptables; yum clean all

RUN mkdir -p /var/lib/mongo && \
    chown mongod.mongod /var/lib/mongo && \
    touch /var/lib/mongo/.keep

ADD ./mongod.conf /etc/

VOLUME ["/var/lib/mongo", "/var/log/mongo"]

# Expose ports
EXPOSE 27017 28017

USER mongod

CMD ["/usr/bin/mongod", "-f", "/etc/mongod.conf" ]
