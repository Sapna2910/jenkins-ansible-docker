FROM centos:latest
ADD http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/Packages/centos-gpg-keys-8-3.el8.noarch.rpm .
RUN rpm -i 'centos-gpg-keys-8-3.el8.noarch.rpm'
RUN yum install -y httpd \
  zip \ 
  unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page276/ocean-vibes.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip ocean-vibes.zip
RUN cp -rvf templatemo_554_ocean_vibes/* .
RUN rm -rf ocean-vibes.zip  templatemo_554_ocean_vibes
CMD ["usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80


