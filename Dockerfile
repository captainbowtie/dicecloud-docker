FROM meteor/meteor-base:20211013T200759Z_489f5fe

USER root
RUN apt-get update
RUN apt-get install --quiet --yes unzip

USER mt
WORKDIR /home/mt

RUN git clone https://github.com/ThaumRystra/DiceCloud dicecloud
WORKDIR /home/mt/dicecloud/app
RUN echo '{"public": {"environment": "production","disablePatreon":true}}' > meteorSettings.json
RUN meteor npm install

ENTRYPOINT meteor --settings meteorSettings.json
