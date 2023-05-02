FROM ubuntu:jammy

USER root
RUN adduser --system mt
USER mt
WORKDIR /home/mt

USER root
RUN apt-get update
RUN apt-get install --quiet --yes curl
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update
RUN apt-get install --quiet --yes nodejs git

USER mt

RUN curl https://install.meteor.com/ | sh

RUN git clone https://github.com/ThaumRystra/DiceCloud dicecloud
WORKDIR /home/mt/dicecloud/app
RUN npm install --production

ENV PATH=$PATH:/home/mt/.meteor

RUN meteor build --directory ~/dc/ --architecture os.linux.x86_64
WORKDIR /home/mt/dc/bundle/programs/server && npm install
WORKDIR /home/mt/dc/bundle

RUN rm -r /home/mt/dicecloud

ENTRYPOINT node main.js

