FROM alpine:3

#RUN apt-get -y update && apt-get -y install bash wget bzip2
RUN apk update 
RUN apk add --no-cache wget bzip2

RUN wget -qO - https://raw.githubusercontent.com/CupCakeArmy/autorestic/master/install.sh | /bin/sh

#RUN apt-get clean && rm -rf /var/lib/apt/lists/*;

WORKDIR /

#RUN apt-get -y update && apt-get -y install restic gettext-base
RUN apk add --no-cache restic gettext

COPY config.yml autorestic_preconfig.yml
COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["bash","entrypoint.sh"]