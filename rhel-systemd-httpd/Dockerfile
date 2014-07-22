FROM redhat/rhel7
MAINTAINER "Dan Walsh" <dwalsh@redhat.com>

ENV container docker

RUN yum -y swap -- remove fakesystemd -- install systemd systemd-libs

RUN yum -y update; yum clean all
RUN yum -y install systemd httpd; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*; \
systemctl enable httpd.service

RUN echo "Test Server" > /var/www/html/index.html

EXPOSE 80

VOLUME [ "/sys/fs/cgroup" ]

CMD [ "/usr/sbin/init" ]
