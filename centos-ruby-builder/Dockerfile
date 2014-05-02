# Self-contained Ruby builder image.
#
# You can use this image to produce an application image providing the source
# code:
#
# $ docker run -v $(pwd):/tmp/src openshift/centos-ruby-builder
# <your application is being build>
#
# $ docker commit <id> your_application
#
# Then you can start your application using:
#
# $ docker run -p :9292 your_application
#
#
FROM openshift/centos-ruby
MAINTAINER Michal Fojtik <mfojtik@redhat.com>

# Set the user we want the Ruby application run under and set the
# user HOME directory as Docker reset this to '/' [1]
#
# [1] https://github.com/dotcloud/docker/issues/2968
#
USER ruby
ENV  HOME /opt/ruby
ENV  PATH $HOME/bin:$PATH

# Set the initial command to `build`. After the application image is built
# then the command is replaced by `run`
#
ADD ./bin/build /opt/ruby/bin/start
ADD ./bin/run   /opt/ruby/bin/run
ADD ./etc       /opt/ruby/etc


ENTRYPOINT ["/opt/ruby/bin/start"]
