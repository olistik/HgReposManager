#!/bin/bash

project_name=$1

#"/PATH/TO/HG/repos"
REPOS_DIR=$2
#"/PATH/TO/HG/scripts"
SCRIPTS_DIR=$3
#"rsync_to_webtest.sh"
SYNC_SCRIPT_NAME=$4
DESTINATION_HOST=$5
DESTINATION_DIR=$6


cd $REPOS_DIR
if [ -e $project_name ]
then
  echo "$REPOS_DIR/$project_name already exists!"
  echo "Deleting ... "
	rm -rf $project_name
fi

echo "Creating $project_name/ ... "
mkdir $project_name
cd $project_name
echo "Initializing mercurial repository ... "
hg init
echo "project: $project_name" > readme
echo "created at: $(date -u +"%F %r")" >> readme
echo "Executing first commit ... "
hg -v add
hg -v commit -m 'first commit'
echo "Adding mercurial hooks ... "
echo "[hooks]" > .hg/hgrc
echo "changegroup = $SCRIPTS_DIR/$SYNC_SCRIPT_NAME \$(pwd) $DESTINATION_HOST $DESTINATION_DIR" >> .hg/hgrc
cat .hg/hgrc
echo "First deploy to webtest ... "
$SCRIPTS_DIR/$SYNC_SCRIPT_NAME $(pwd) $DESTINATION_HOST $DESTINATION_DIR
