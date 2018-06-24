FROM resin/armv7hf-debian:latest

# get dependencies via apt
RUN apt-get update && apt-get install apt-utils apt-transport-https build-essential git curl python cups libcups2-dev avahi-daemon libnss-mdns libusb-1.0-0 libusb-1.0-0-dev iputils-ping

# Enable avahi-daemon
RUN systemctl enable avahi-daemon.service

# install nvm and node
RUN curl -o /tmp/nvm-install.sh https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh
RUN chmod +x /tmp/nvm-install.sh && /tmp/nvm-install.sh
RUN /bin/bash -c "source /root/.nvm/nvm.sh && nvm install 8.11.3 && nvm use 8.11.3 && npm install --global --production --unsafe-perm yarn"
