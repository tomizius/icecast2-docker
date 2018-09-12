From ubuntu:18.04

MAINTAINER Thomas Englert "thomas-englert@hotmail.de"

RUN addgroup icecast && \
    adduser --no-create-home --disabled-password icecast2

RUN apt-get update && \
    apt-get -y install icecast2 sudo

COPY icecast.xml /etc/icecast2/
COPY start.sh /start.sh

CMD ["/start.sh"]

EXPOSE 8888

RUN chown -R icecast2 /etc/icecast2


