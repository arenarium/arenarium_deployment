docker-compose -f docker-compose.init.yml up -d
sleep 2
docker-compose -f docker-compose.init.yml down
