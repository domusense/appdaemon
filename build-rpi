docker build -f Dockerfile -t domu/appdaemon-rpi:latest .

docker run --rm -it -p 5050:5050 \
-e HA_URL="http://192.168.1.18:8123" \
-e HA_KEY="12345678" \
-e DASH_URL="http://192.168.1.18:5050" \
domu/appdaemon-rpi:latest
