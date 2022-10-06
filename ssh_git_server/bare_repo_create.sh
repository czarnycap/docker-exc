#!/bin/bash

#argument as repo name
#TODO validate if user exists
#TODO validate if git is installed

# if [$# -eq 0 ]
# {

# }
GIT_DIR=/home/git

#[[ -d $GIT_DIR ]] && echo "This $GIT_DIR exists!"|| echo "using $PWD as a base dir"

if [[ -d $GIT_DIR ]] 
    then 
    echo "$GIT_DIR exists!.. creating repos inside"
    else 
    echo "using $PWD as a base dir for repos creation"
    GIT_DIR=$PWD
fi



#check number of arguments
if [ "$#" -eq 0 ];then echo "please provide repo names as arguments"&& exit 127;fi



for REPO in $*
do
 echo "$REPO created"
 cd $GIT_DIR
 mkdir $GIT_DIR/$REPO
 cd $GIT_DIR/$REPO
 git init --bare 2>&1>$GIT_DIR/repo_creation_$REPO.log
 
done

