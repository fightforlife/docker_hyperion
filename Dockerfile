FROM ubuntu:rolling

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install curl wget

RUN curl -k -L --output install_hyperion.sh --get https://raw.githubusercontent.com/hyperion-project/hyperion/master/bin/install_hyperion.sh
RUN chmod +x install_hyperion.sh
RUN sh ./install_hyperion.sh

CMD ["hyperiond", "/etc/hyperion/hyperion.config.json"]
