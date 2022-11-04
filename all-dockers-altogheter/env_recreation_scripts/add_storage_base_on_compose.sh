#requires yq tool, could be installed with snap

COMPOSE_PATH=/home/akowal/github/docker-exc/all-dockers-altogheter
yq -r '.volumes' $COMPOSE_PATH/docker-compose.yml |grep -v external|sed 's/\://g' > ./storage_list
#run rather in console than as a script
for i in $(cat ./storage_list); do  docker volume create $i; done
