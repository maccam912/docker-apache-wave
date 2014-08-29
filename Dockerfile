FROM ubuntu
MAINTAINER Matt Koski <maccam912@gmail.com>
RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install python-mysqldb mercurial python-twisted apache2 libapache2-mod-python rabbitmq-server git python build-essential wget screen tmux curl eclipse default-jre subversion mongodb ant -y
RUN mkdir /Development
RUN cd /Development && git clone git://github.com/joyent/node
RUN cd /Development/node && ./configure && make && make install
RUN rm -rf /Development/node
RUN npm install -g meteorite bower grunt-cli yo demeteorizer
RUN cd /Development && wget -O - https://install.meteor.com/ | bash && cp ~/.meteor/tools/latest/launch-meteor /usr/bin/meteor
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
RUN svn co https://svn.apache.org/repos/asf/incubator/wave/trunk
RUN cd trunk && ant
EXPOSE 80:80
EXPOSE 443:443
EXPOSE 3000:3000
RUN echo "Done. Run 'mrt create <app-name>' to create meteor app. cd into the folder created and run 'meteor' to run your webapp locally."

