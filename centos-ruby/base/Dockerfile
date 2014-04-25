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
      yum install --assumeyes ruby193 ruby193-ruby-devel && \
      yum clean all

# Create 'ruby' account we will use to run Ruby application
#
RUN mkdir -p /opt/ruby/{gems,run,src} && \
      groupadd -r ruby -f -g 433 && \
      useradd -u 431 -r -g ruby -d /opt/ruby -s /sbin/nologin -c "Ruby application" ruby && \
      chown -R ruby:ruby /opt/ruby

ADD ./bin /usr/bin/
ADD ./conf /opt/ruby/conf/
RUN chmod +x /usr/bin/{prepare,run,ruby_context,save-artifacts}

# FIXME: This might be a potential bug in STI where if we keep the USER
# instruction here, the resulting application image will fail to run.
#
# USER ruby

EXPOSE 9292
