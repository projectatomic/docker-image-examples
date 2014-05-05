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

ADD ./bin       /opt/ruby/bin
ADD ./etc       /opt/ruby/etc

# The initial 'start' command will trigger an application build when it runs in
# 'self-contained' builder context. After application is built, then this
# command is replaced in final application image by the 'run' command.
#
RUN chown -R ruby:ruby /opt/ruby/bin

USER ruby
ENTRYPOINT ["/opt/ruby/bin/start"]
