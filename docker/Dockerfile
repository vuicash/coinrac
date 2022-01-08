FROM debian:stretch
LABEL maintainer="Coinrac Developers <dev@coinrac.org>"
LABEL description="Dockerised CoinracCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
