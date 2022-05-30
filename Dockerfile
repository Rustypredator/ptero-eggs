# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: httpd
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM httpd

# install all pre-requisites, these will be needed always
RUN apt-get update && apt-get install -y openssl && adduser -D -h /home/container container

MAINTAINER Rustypredator, <contact@rusty.info>

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
