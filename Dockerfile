FROM ubuntu:latest
MAINTAINER Matt Koski <maccam912@gmail.com>
RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install vim mercurial python-mysqldb mercurial python-twisted apache2 libapache2-mod-python rabbitmq-server git python build-essential wget screen tmux curl eclipse default-jre subversion mongodb ant -y
RUN mkdir /Development
#RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
RUN cd /Development && hg clone https://wave-protocol.googlecode.com/hg/ wave
RUN cd /Development/wave && ant -f server-config.xml
RUN cd /Development/wave && ant compile-gwt dist-server
RUN cd /Development/wave && ant
RUN cd /Development/wave && ./run-server.sh
EXPOSE 80:80
EXPOSE 443:443
EXPOSE 3000:3000
EXPOSE 9898:9898
