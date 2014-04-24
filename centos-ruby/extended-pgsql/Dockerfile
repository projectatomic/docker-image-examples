# centos-ruby:extended_pgsql
#
# This image provides an additional dependencies required for PostgreSQL
# development in ruby.
#

FROM mfojtik/centos-ruby:extended
MAINTAINER Michal Fojtik <mfojtik@redhat.com>

RUN yum install --assumeyes postgresql-devel && yum clean all
