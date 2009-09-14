#!/bin/bash

DESTINATION_HOST=localhost
DESTINATION_DIR="/PATH/TO/HG/webtests/"
TEMP_REPOS_DIR="/PATH/TO/HG/temp_repos/"

project_dir=$1
project_name=$(basename $1)

cd $TEMP_REPOS_DIR
if [ ! -e $project_name ]
then
	hg clone $project_dir
fi
cd $project_name
hg pull
hg update
cd ..
rsync -az "$project_name" "$DESTINATION_HOST:$DESTINATION_DIR"
