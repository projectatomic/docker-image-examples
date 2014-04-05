FROM fedora:20
MAINTAINER Clayton Coleman <ccoleman@redhat.com>

RUN yum install -y gcc && yum clean all
ADD http://haproxy.1wt.eu/download/1.5/src/devel/haproxy-1.5-dev22.tar.gz /haproxy/source.tar.gz
RUN cd /haproxy && \
    tar --strip-components=1 -xvf source.tar.gz && \
    make TARGET=linux2668
VOLUME ["/var/run/haproxy"]
RUN useradd haproxy
USER haproxy
ADD ./example.cfg /var/run/haproxy/haproxy.cfg

EXPOSE 8080
CMD ["/haproxy/haproxy-systemd-wrapper", "-f", "/var/run/haproxy/haproxy.cfg", "-p", "/run/haproxy.pid"]
