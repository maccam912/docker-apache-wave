docker-apache-wave
==================

For the Apache Wave in a Box (currently in the incubator, http://incubator.apache.org/wave/) this docker file will set up an environment capable of running WiaB.

The Wave server runs in the docker container on port 9898. The script to start the server is in /Development/wave/run-server.sh.

**To make it work correctly**
1. edit /Development/wave/server.config, and replace all "localhost" with "0.0.0.0" to make it available remotely.
2. When ready to start, a common way to start it interactively is "docker run -i -t -p 80:9898 maccam912/docker-apache-wave /bin/bash"
3. If you want it running in the background and don't care about having control from the inside, "docker run -p 80:9898 maccam912/docker-apache-wave" should do the trick. You'll need to log in interactively once to do step one though.

*Note:* In these examples I'm taking incoming connections on port 80 and forwarding them to 9898. If you don't like that setup, change the port that is forwarded, or the port the wave server is running on.
