From ubuntu:18.04

MAINTAINER Thomas Englert "thomas-englert@hotmail.de"

RUN apt-get update && \
    apt-get -y install icecast2 sudo

ENV ICE_SOURCE_PASS=mypass
ENV ICE_RELAY_PASS=mypass
ENV ICE_ADMIN_PASS=mypass
ENV ICE_PORT=8000
ENV HOSTNAME=your.host.name
ENV ICE_MAX_CLIENTS=1000

COPY icecast.xml /etc/icecast2/
COPY start.sh /start.sh

CMD ["/start.sh"]

EXPOSE 8888

RUN chown -R icecast2 /etc/icecast2


