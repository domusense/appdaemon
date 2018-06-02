FROM arm32v7/python:3.6.5-stretch

VOLUME /conf
VOLUME /certs
EXPOSE 5050

# Environment vars we can configure against
# But these are optional, so we won't define them now
#ENV HA_URL http://hass:8123
#ENV HA_KEY secret_key
#ENV DASH_URL http://hass:5050
#ENV EXTRA_CMD -D DEBUG

# Copy appdaemon into image
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Add user so we aren't running as root.
RUN useradd --home-dir /usr/src/node-red --no-create-home domu \
    && chown -R domu:domu /conf \
    && chown -R domu:domu /usr/src/app \
    && chown -R domu:domu /certs

USER domu

COPY . .

# Install
RUN pip3 install .

# Start script
RUN chmod +x /usr/src/app/dockerStart.sh

CMD [ "./dockerStart.sh" ]
