FROM rhel6:latest

ADD ./openshift-origin-deps.repo /etc/yum.repos.d/openshift-origin-deps.repo

# Execute system update
RUN yum -y update

# Install packages necessary to install and run EAP
RUN yum -y install java-1.7.0-openjdk-devel maven3 unzip
RUN yum clean all

# Copy the EAP to image, unpack and clean up afterwards
ADD jboss-eap-6.2.0.zip /opt/
RUN unzip -q /opt/jboss-eap-6.2.0.zip -d /opt/

# Upgrade to 6.2.2
ADD jboss-eap-6.2.2.zip /opt/
RUN /opt/jboss-eap-6.2/bin/jboss-cli.sh --command="patch apply /opt/jboss-eap-6.2.2.zip"

# Install mysql module
ADD mysql-module.xml /opt/jboss-eap-6.2/modules/system/layers/base/com/mysql/jdbc/main/module.xml
ADD mysql-connector-java-5.1.30-bin.jar /opt/jboss-eap-6.2/modules/system/layers/base/com/mysql/jdbc/main/mysql-connector-java.jar

# Install the mongodb module
ADD mongodb-module.xml /opt/jboss-eap-6.2/modules/system/layers/base/com/mongodb/main/module.xml
ADD mongo-java-driver-2.9.3.jar /opt/jboss-eap-6.2/modules/system/layers/base/com/mongodb/main/mongo-java-driver.jar

RUN groupadd -r jbosseap -g 433 && \
useradd -u 431 -r -g jbosseap -d /opt/jboss-eap-6.2 -s /sbin/nologin -c "JBossEAP user" jbosseap && \
chown -R jbosseap:jbosseap /opt/jboss-eap-6.2

# Link the EAP installation
RUN ln -s /opt/jboss-eap-6.2 /eap

# Add the launch script
ADD launch /opt/jboss-eap-6.2/bin/

# Specify default values for entry point
CMD ["/eap/bin/launch", "standalone", "-c", "standalone-ha.xml", "-b", "0.0.0.0"]

# Add scripts for sti compatibility
ADD ./prepare /usr/bin/prepare
ADD ./run /usr/bin/run
ADD ./save-artifacts /usr/bin/save-artifacts
RUN chmod a+rx /usr/bin/{prepare,run,save-artifacts}

USER jbosseap

# Expose ports
EXPOSE 8080

# Set default url for assemble/run/save-artifacts scripts
ENV STI_SCRIPTS_URL https://raw.githubusercontent.com/projectatomic/docker-image-examples/master/rhel-jbosseap/.sti/bin
