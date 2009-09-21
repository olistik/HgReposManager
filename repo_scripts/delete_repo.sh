#!/bin/bash

project_name=$1

#"/PATH/TO/HG/repos"
REPOS_DIR=$2
#"localhost"
DESTINATION_HOST=$3
#"/PATH/TO/HG/webtests"
DESTINATION_DIR=$4

echo "Deleting webtest instance ..."
rsh $DESTINATION_HOST "rm -rf $DESTINATION_DIR/$project_name"
echo "Deleting local repository ... "
rm -rf "$REPOS_DIR/$project_name"
echo "Finished!"
