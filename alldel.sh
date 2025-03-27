dockerstart.sh
docker system prune -a -f
docker container prune -a -f
docker image prune -a -f
docker volume prune -f
docker network prune -f
dockerstop.sh
