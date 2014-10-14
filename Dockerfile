FROM ubuntu
MAINTAINER Matt Koski <maccam912@gmail.com>
RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install python-mysqldb mercurial python-twisted apache2 libapache2-mod-python rabbitmq-server git python build-essential wget screen tmux curl eclipse default-jre subversion mongodb ant -y
RUN mkdir /Development
RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
RUN svn co https://svn.apache.org/repos/asf/incubator/wave/trunk
RUN cd trunk && ant && ./run-server.sh
EXPOSE 80:80
EXPOSE 443:443
EXPOSE 3000:3000
