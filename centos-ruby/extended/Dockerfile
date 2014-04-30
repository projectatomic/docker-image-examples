# centos-ruby-extended
#
# This image provide additional resource for Ruby developers such as additional
# development files and libraries.
#

FROM openshift/centos-ruby
MAINTAINER Michal Fojtik <mfojtik@redhat.com>

# The nodejs010 runtime is needed to make Rails assets compilation possible.
#
RUN yum install --assumeyes \
      gcc-c++ automake autoconf curl-devel openssl-devel \
      zlib-devel libxslt-devel libxml2-devel \
      mysql-libs mysql-devel postgresql-devel sqlite-devel \
      nodejs010-nodejs && \
      yum clean all # Clean up yum cache at the end.

# Set RoR 'execjs' runtime to NodeJS v8
#
ENV EXECJS_RUNTIME Node
