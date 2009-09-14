#!/bin/bash

project_dir=$1
project_name=$(basename $1)

#"localhost"
DESTINATION_HOST=$2
#"/PATH/TO/HG/webtests/"
DESTINATION_DIR=$3
#"/PATH/TO/HG/temp_repos"
TEMP_REPOS_DIR=$4


cd $TEMP_REPOS_DIR
if [ ! -e $project_name ]
then
	hg clone $project_dir
fi
cd $project_name
hg pull
hg update
cd ..
rsync -az "$project_name" "$DESTINATION_HOST:$DESTINATION_DIR/"
