FROM python:3.7-alpine
FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
  zip \ 
  unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page276/ocean-vibes.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip ocean-vibes.zip
RUN cp -rvf templatemo_554_ocean_vibes/* .
RUN rm -rf ocean-vibes.zip  templatemo_554_ocean_vibes
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80


 
