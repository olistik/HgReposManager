#!/bin/bash

REPOS_DIR="/PATH/TO/HG/repos"
TEMP_REPOS_DIR="/PATH/TO/HG/temp_repos"
DESTINATION_HOST="localhost"
DESTINATION_DIR="/PATH/TO/HG/webtests/"

project_name=$1

echo "Deleting webtest instance ..."
rsh $DESTINATION_HOST "rm -rf $DESTINATION_DIR/$project_name"
echo "Deleting local temporary repository ... "
rm -rf "$TEMP_REPOS_DIR/$project_name"
echo "Deleting local repository ... "
rm -rf "$REPOS_DIR/$project_name"
echo "Finished!"
