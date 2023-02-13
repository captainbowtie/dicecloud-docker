FROM meteor/meteor-base:20211013T200759Z_489f5fe

USER root
RUN apt-get update
RUN apt-get install --quiet --yes unzip

USER mt
WORKDIR /home/mt

RUN wget https://github.com/ThaumRystra/DiceCloud/archive/refs/heads/version-1.zip
RUN unzip version-1.zip
WORKDIR /home/mt/DiceCloud-version-1/app
RUN meteor npm install

ENTRYPOINT meteor
