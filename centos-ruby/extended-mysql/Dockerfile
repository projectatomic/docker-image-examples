# centos-ruby:extended_mysql
#
# This image provides an additional dependencies required for mysql
# development in ruby.
#

FROM mfojtik/centos-ruby:extended
MAINTAINER Michal Fojtik <mfojtik@redhat.com>

RUN yum install --assumeyes mysql-libs mysql-devel && yum clean all
