FROM centos
MAINTAINER Derek Carr <decarr@redhat.com>

# update, install required, clean
RUN yum -y update && yum install -y haproxy && yum clean all 

# setup haproxy configuration
ADD ./etc/haproxy.conf /etc/haproxy.conf

# Expose ports
EXPOSE 80
EXPOSE 1936

CMD ["haproxy", "-f", "/etc/haproxy.conf"]