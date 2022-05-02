FROM debian:bullseye

WORKDIR /home
RUN apt update && apt install -y \
	apache2 \
	nginx \
	tor \
	vim \
	systemctl

EXPOSE 80
COPY torrc /etc/tor
COPY start_web.sh /home
#CMD nginx && tor
