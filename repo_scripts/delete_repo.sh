#!/bin/bash

project_name=$1

#"/PATH/TO/HG/repos"
REPOS_DIR=$2
#"/PATH/TO/HG/temp_repos"
TEMP_REPOS_DIR=$3
#"localhost"
DESTINATION_HOST=$4
#"/PATH/TO/HG/webtests"
DESTINATION_DIR=$5

echo "Deleting webtest instance ..."
rsh $DESTINATION_HOST "rm -rf $DESTINATION_DIR/$project_name"
echo "Deleting local temporary repository ... "
rm -rf "$TEMP_REPOS_DIR/$project_name"
echo "Deleting local repository ... "
rm -rf "$REPOS_DIR/$project_name"
echo "Finished!"
