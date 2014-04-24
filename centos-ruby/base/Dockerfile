# This is a base 'centos-ruby' image which provides basic
# support for ruby193 applications
#

FROM       centos:latest
MAINTAINER Michal Fojtik <mfojtik@redhat.com>

# Pull in important updates and then install ruby193 SCL
#
RUN yum update --assumeyes && \
      yum install --assumeyes centos-release-SCL gettext && \
      yum install --assumeyes ruby193 ruby193-ruby-devel && \
      yum clean all

# Create 'ruby' account we will use to run Ruby application
#
RUN mkdir -p /opt/ruby/{.gems,run,src} && \
      groupadd -r ruby -f -g 433 && \
      useradd -u 431 -r -g ruby -d /opt/ruby -s /sbin/nologin -c "Ruby application" ruby && \
      chown -R ruby:ruby /opt/ruby

ADD ./bin /usr/bin/
ADD ./conf /opt/ruby/conf/
RUN chmod +x /usr/bin/{prepare,run,ruby_context,save-artifacts}

# This build image use Puma[1] web server to run any Rack based Ruby application
# [1] http://puma.io
#
# TODO: Provide an CentOS/SCL RPM for puma webserver
#
#RUN /usr/bin/ruby_context "gem install puma --version 2.8.2 \${GEM_INSTALL_OPTS}" && \
#    /usr/bin/ruby_context "gem install rack --version 1.5.2 \${GEM_INSTALL_OPTS}"
#
# FIXME: Having user here will cause container fail to start when using with STI
# build.
#
# USER ruby
EXPOSE 8000
