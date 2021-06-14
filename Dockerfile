FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster

# install all pre-requisites, these will be needed always
RUN apt-get update && apt-get install -y \
      openssl \
      libopus-dev \
      opus-tools \
      ffmpeg \
      zip

LABEL author="HuntersTavern" maintainer="contact@hunters-tavern.de"

# set user to run under
USER container
ENV  USER=container HOME=/home/container

# set the work dir to data, so users can properly mount their config files to this dir with -v /host/path/to/data:/data
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
