FROM fedora:latest

RUN dnf -y update && dnf -y upgrade
RUN dnf install -y httpd httpd-manual

COPY conf/httpd.conf /etc/httpd/conf/httpd.conf
COPY httpd-foreground /usr/local/bin/
RUN chmod -v +x /usr/local/bin/httpd-foreground
RUN htpasswd -bm -c /var/www/html/.htpasswd hoge fuga

ENV PATH $PATH:/usr/local/bin/
EXPOSE 80

CMD [ "httpd-foreground" ]
