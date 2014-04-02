FROM ccoleman/ubuntu-mongodb
MAINTAINER Clayton Coleman <ccoleman@redhat.com>

CMD ["/usr/bin/mongod", "--config", "/etc/mongodb.conf", "--logpath", "/dev/stdout", "--nohttpinterface", "--replSet", "replica0"]