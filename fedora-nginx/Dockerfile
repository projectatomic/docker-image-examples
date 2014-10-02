FROM fedora:20
MAINTAINER Tim Marcinowski <marshyski@gmail.com>

RUN yum update -y
RUN yum install -y nginx && yum clean all
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN echo "nginx on Fedora" > /usr/share/nginx/html/index.html

EXPOSE 80

CMD [ "/usr/sbin/nginx" ]
