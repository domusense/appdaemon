docker build -f Dockerfile -t domu/appdaemon-rpi:latest .

# User data volume 
docker volume create --name appdaemon_user_data

if [ $? -ne 0 ]; then
    echo "Cannot create volume for user data."
    exit 1
fi

#docker run --rm -it -p 5050:5050 \
#-v appdaemon_user_data:/conf --name appdaemon \
#-e HA_URL="http://192.168.1.18:8123" \
#-e HA_KEY="12345678" \
#-e DASH_URL="http://192.168.1.18:5050" \
#domu/appdaemon-rpi:latest

docker run --name=appdaemon -d -p 5050:5050 \
  --restart=always \
  -e HA_URL="http://172.18.0.3:8123" \
  -e HA_KEY="12345678" \
  -e DASH_URL="http://0.0.0.0:5050" \
  -v /appdaemon/conf:/conf \
  domu/appdaemon-rpi:latest

