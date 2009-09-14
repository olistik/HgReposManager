#!/bin/bash

project_dir=$1
project_name=$(basename $1)

#"localhost"
DESTINATION_HOST=$2
#"/PATH/TO/HG/webtests/"
DESTINATION_DIR=$3

cd $project_dir
rsync -az "$project_name" "$DESTINATION_HOST:$DESTINATION_DIR/"
