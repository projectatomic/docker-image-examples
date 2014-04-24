# centos-wildfly-standalone
#
# This image provides a base for building and running wildfly applications.
# It builds using maven and runs the resulting artifacts on wildfly 8.1.

FROM centos

MAINTAINER Ben Parees <bparees@redhat.com>

RUN yum -y update && \
    yum -y install tar java-1.7.0-openjdk java-1.7.0-openjdk-devel unzip which bc vim vi && \
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
ADD ./wfmodules/ /wildfly/modules/    

# Configure Source-To-Image scripts
ADD ./bin /usr/bin/
RUN chmod a+rx /usr/bin/{prepare,run,save-artifacts}

# Add geard/sti wildfly customizations
ADD ./wfbin/standalone.conf /wildfly/bin/standalone.conf
ADD ./wfcfg/standalone.xml /wildfly/standalone/configuration/standalone.xml

# Add sample jee application
# This app will be built/run if no other source is bind-mounted to mask it.
ADD https://github.com/bparees/openshift-jee-sample/archive/master.tar.gz master.tar.gz
RUN mkdir /tmp/src && \
    tar -C /tmp/src --strip-components=1 -zxf master.tar.gz && \
    rm master.tar.gz
    
# Configure source location
RUN mkdir -p /opt/wildfly/source
WORKDIR /opt/wildfly/source

# Create wildfly group and user, set file ownership to that user.
RUN groupadd -r wildfly -g 433 && \
    useradd -u 431 -r -g wildfly -d /opt/wildfly -s /sbin/nologin -c "Wildfly user" wildfly && \
    chown -R wildfly:wildfly /wildfly && \
    chown -R wildfly:wildfly /opt/wildfly && \
    chown -R wildfly:wildfly /tmp/src

USER wildfly
EXPOSE 7600 8080 9990 9999
CMD /usr/bin/usage
