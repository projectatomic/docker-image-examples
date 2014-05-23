# Self-contained Ruby builder image.
#
# You can use this image to produce an application image providing the source
# code:
#
# $ docker run -v $(pwd):/tmp/src openshift/centos-ruby-selfcontained
# <your application is being build>
#
# $ docker commit <id> your_application
#
# Then you can start your application using:
#
# $ docker run -p :9292 your_application
#
#
# This image provides a base for running Ruby based applications. It provides
# just base Ruby installation using SCL and Ruby application server.
#
# If you want to use Bundler with C-extensioned gems or MySQL/PostGresql, you
# can use 'centos-ruby-extended' image instead.
#

FROM       centos
MAINTAINER Michal Fojtik <mfojtik@redhat.com>

# Pull in important updates and then install ruby193 SCL
#
RUN yum update --assumeyes --skip-broken && \
      yum install --assumeyes centos-release-SCL gettext tar which && \
      yum install --assumeyes ruby193 ruby193-ruby-devel \
      gcc-c++ automake autoconf curl-devel openssl-devel \
      zlib-devel libxslt-devel libxml2-devel \
      mysql-libs mysql-devel postgresql-devel sqlite-devel \
      nodejs010-nodejs && \
      yum clean all

# Create 'ruby' account we will use to run Ruby application
#
RUN mkdir -p /opt/ruby/{gems,run,src,bin} && \
      groupadd -r ruby -f -g 433 && \
      useradd -u 431 -r -g ruby -d /opt/ruby -s /sbin/nologin -c "Ruby application" ruby

ADD ./bin /opt/ruby/bin/
ADD ./etc /opt/ruby/etc/

# FIXME: The STI require all scripts in /usr/bin path, this layer is here to
#        maintain backward compatibility
#
RUN cp -f /opt/ruby/bin/prepare /usr/bin/prepare && \
    cp -f /opt/ruby/bin/run /usr/bin/run

RUN chown -R ruby:ruby /opt/ruby

# Set the 'root' directory where this build will search for Gemfile and
# config.ru.
#
# This can be overridden inside another Dockerfile that uses this image as a base
# image or in STI via the '-e "APP_ROOT=subdir"' option.
#
# Use this in case when your application is contained in a subfolder of your
# GIT repository. The default value is the root folder.
#
ENV APP_ROOT .
ENV HOME     /opt/ruby
ENV PATH     $HOME/bin:$PATH

# The initial 'start' command will trigger an application build when it runs in
# 'self-contained' builder context. After application is built, then this
# command is replaced in final application image by the 'run' command.
#
RUN chown -R ruby:ruby /opt/ruby/bin

USER ruby
ENTRYPOINT ["/opt/ruby/bin/start"]
