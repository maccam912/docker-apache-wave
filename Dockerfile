FROM ubuntu:latest
MAINTAINER Matt Koski <maccam912@gmail.com>
RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install vim python-mysqldb mercurial python-twisted apache2 libapache2-mod-python rabbitmq-server git python build-essential wget screen tmux curl eclipse default-jre subversion mongodb ant -y
RUN mkdir /Development
RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
RUN cd /Development && wget https://people.apache.org/~al/wave_rc/0.4-rc4/apache-wave-bin-0.4-incubating.tar.bz2 && tar -jxvf apache* && cd apache* && cp server.config.example server.config && ./run-server.sh
EXPOSE 80:80
EXPOSE 443:443
EXPOSE 3000:3000
