FROM debian:jessie

MAINTAINER Anushan Easwaramoorthy <EAnushan@hotmail.com>

# Install packages.
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	wget \
	bzip2 \
	build-essential \
	libssl-dev \
	tcl-dev \
	libxml2-dev \
	libpcre3-dev

# Download Apache Traffic Server.
RUN cd /opt && wget http://mirror.csclub.uwaterloo.ca/apache/trafficserver/trafficserver-5.3.0.tar.bz2 && tar xf trafficserver-5.3.0.tar.bz2 && cd trafficserver-5.3.0 && ./configure && make && make install

# Configure dynamic linker.
RUN ldconfig

# Configuration.
RUN sed -i 's/\(CONFIG proxy.config.http.server_ports STRING\).*$/\1 80 443/g' /usr/local/etc/trafficserver/records.config

# Expose ports.
EXPOSE 80
EXPOSE 443

# Copy startup script.
COPY trafficserver-foreground /usr/local/bin/

# Start!
CMD ["trafficserver-foreground"]