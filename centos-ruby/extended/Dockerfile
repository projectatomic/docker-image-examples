# centos-ruby-extended
#
# This image provide additional resource for Ruby developers such as additional
# development files and libraries.
#

FROM openshift/centos-ruby
MAINTAINER Michal Fojtik <mfojtik@redhat.com>

RUN yum install --assumeyes gcc automake autoconf curl-devel openssl-devel \
      zlib-devel libxslt-devel libxml2-devel \
      mysql-libs mysql-devel \
      postgresql-devel && yum clean all
