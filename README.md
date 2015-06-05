# docker-trafficserver
Docker configuration for running Apache Traffic Server (ATS).

## Usage
`docker run -d --name trafficserver -p 80:80 -p 443:443 -e TRAFFICSERVER_HOST=10.11.12.13 -e TRAFFICSERVER_DEBUG=true eanushan/docker-trafficserver`

## Configuration
The following environment variables are available for configuration.

- TRAFFICSERVER_HOST (required): Origin server IP or Hostname.
- TRAFFICSERVER_DEBUG: Provides access to cache inspector located at http://{trafficserverip}/trafficservercache/

## Manual Configuration
You can optionally mount over any of the files located in `/usr/local/etc/trafficserver/` to configure the trafficserver yourself. See https://docs.trafficserver.apache.org/en/latest/index.html for more info.

## Logging
Log files are located under `/usr/local/var/log/trafficserver/`.
