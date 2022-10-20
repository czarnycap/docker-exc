#!/bin/bash

DOCKER_RUNNING_LIST=$(docker ps -q)
echo $DOCKER_RUNNING_LIST
echo starting the script...
#|xargs -n1 docker exec hostname -I
EXEC_COMMAND="uname -r"

function script_usage() {
    cat << EOF
Usage:
     -h|--help                  Displays this help
     -v|--verbose               Displays verbose output
    -nc|--no-colour             Disables colour output
    -cr|--cron                  Run silently unless we encounter an error
EOF
}

for docker in $DOCKER_RUNNING_LIST
    do
#        echo $image
#        docker exec $image $EXEC_COMMAND
        [[ $(cat /etc/passwd|grep -v ansible) ]] || echo exit 1
        #docker exec $image hostname -I
       #docker exec $docker useradd -m -G sudo ansible
       docker exec $docker uname -r
       echo $docker
       
       # docker exec $image useradd -m -aG sudo ansible
#        docker exec $image id ansible
    done

# check if ansible user exists
# check what flavour of linux you are using (debian/alpine/ubuntu/centos/windows)
# add user ansible to the (as per system)
# copy ssh_public key
# check connection via ssh using ansible user

#[[ $i =~ $regex  ]] && echo "file $i is a match to a regex'$regex'"

