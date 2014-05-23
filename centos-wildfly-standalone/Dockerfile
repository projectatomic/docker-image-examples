# centos-wildfly-standalone
#
# This image provides a base for building and running wildfly applications.
# It builds using maven and runs the resulting artifacts on wildfly 8.1.

FROM centos

MAINTAINER Ben Parees <bparees@redhat.com>

RUN yum -y update && \
    yum -y install tar java-1.7.0-openjdk java-1.7.0-openjdk-devel unzip which bc vi&& \
    yum clean all

# Install maven
ADD http://mirror.cc.columbia.edu/pub/software/apache/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz apache-maven-3.0.5-bin.tar.gz
RUN tar xzf apache-maven-3.0.5-bin.tar.gz -C /usr/local && \
    rm apache-maven-3.0.5-bin.tar.gz && \
    ln -s /usr/local/apache-maven-3.0.5/bin/mvn /usr/local/bin/mvn

# Install wildfly
ADD http://download.jboss.org/wildfly/8.1.0.CR1/wildfly-8.1.0.CR1.tar.gz wildfly-8.1.0.CR1.tar.gz
RUN tar -xf wildfly-8.1.0.CR1.tar.gz && \
    rm wildfly-8.1.0.CR1.tar.gz && \
    mv wildfly-8.1.0.CR1 wildfly && \
    /wildfly/bin/add-user.sh admin passw0rd_  --silent

# Add mysql and postgres jbdbc driver modules
ADD ./wfmodules/ /wildfly/modules/    

# Add wildfly customizations
ADD ./wfbin/standalone.conf /wildfly/bin/standalone.conf
ADD ./wfcfg/standalone.xml /wildfly/standalone/configuration/standalone.xml
   
# Create wildfly group and user, set file ownership to that user.
RUN groupadd -r wildfly -g 433 && \
    useradd -u 431 -r -g wildfly -d /opt/wildfly -s /sbin/nologin -c "Wildfly user" wildfly && \
    chown -R wildfly:wildfly /wildfly && \
    chown -R wildfly:wildfly /opt/wildfly && \
    chown -R wildfly:wildfly /tmp/src

USER wildfly
EXPOSE 7600 8080 9990 9999
CMD /wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
