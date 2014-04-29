# centos-ruby
#
# This image provide a base for running Ruby based applications. It provides
# just base Ruby installation using SCL and Ruby application server.
#
# If you want to use Bundler with C-extensioned gems or MySQL/PostGresql, you
# can use 'centos-ruby-extended' image instead.
#

FROM       centos
MAINTAINER Michal Fojtik <mfojtik@redhat.com>

# Pull in important updates and then install ruby193 SCL
#
RUN yum update --assumeyes && \
      yum install --assumeyes centos-release-SCL gettext tar which && \
      yum install --assumeyes ruby193 ruby193-ruby-devel \
      gcc-c++ automake autoconf curl-devel openssl-devel \
      zlib-devel libxslt-devel libxml2-devel \
      mysql-libs mysql-devel postgresql-devel sqlite-devel \
      nodejs010-nodejs && \
      yum clean all

# Create 'ruby' account we will use to run Ruby application
#
RUN mkdir -p /opt/ruby/{gems,run,src} && \
      groupadd -r ruby -f -g 433 && \
      useradd -u 431 -r -g ruby -d /opt/ruby -s /sbin/nologin ruby

ADD ./bin /opt/ruby/bin/
ADD ./etc /opt/ruby/etc/

RUN chown -R ruby:ruby /opt/ruby

# Set the 'root' directory where this build will search for Gemfile and
# config.ru.
# Use this in case when your application is contained in a subfolder of your
# GIT repository. The default value is the root folder.
#
ENV APP_ROOT .

EXPOSE 9292

CMD ["/opt/ruby/bin/usage"]
