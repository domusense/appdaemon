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

# seto WORKDIR
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Add user with sudo privileges
RUN useradd --home-dir /usr/src/app --no-create-home domu \
    && usermod -a -G staff domu \
    && chown -R domu:domu /conf \
    && chown -R domu:domu /usr/src/app \
    && chown -R domu:domu /certs

# set docker user
USER domu

# copy image
COPY . .

# Install
RUN sudo pip3 install .

# Start script
RUN chmod +x /usr/src/app/dockerStart.sh

CMD [ "./dockerStart.sh" ]
