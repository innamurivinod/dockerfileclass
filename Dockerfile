FROM ubuntu:14.04
MAINTAINER vikas chennybirru@gmail.com
ADD http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.16/bin/apache-tomcat-8.5.16.tar.gz /root/
COPY epel-release-latest-7.noarch.rpm /root/epel-release-latest-7.noarch.rpm
ADD 2.txt /root/2.txt
ARG foo=vikas
LABEL mylabel=$foo
RUN apt-get update && touch vikas.txt
SHELL ["/bin/sh", "-c"]
RUN mkdir /root/gavas
WORKDIR /root/gavas/
RUN touch gavas.txt && apt-get install -y apache2 && service apache2 start
EXPOSE 80
VOLUME /root/gavas
RUN useradd jenkins
USER jenkins
RUN echo $USER && exit
USER root
ENTRYPOINT ["/bin/ping"]
CMD ["google.com"]
