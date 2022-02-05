#!/bin/sh -l

set -e
set -x

SOURCE_REPO=$1
SOURCE_BRANCH=$2
DESTINATION_REPO=$3
DESTINATION_BRANCH=$4
IGNORE_FOLDER=$5

git config user.name "$GITHUB_ACTOR"
git config user.email "$GITHUB_ACTOR@users.noreply.github.com"

SOURCE_REPO="https://x-access-token:$SECRET_TOKEN@github.com/${SOURCE_REPO}.git"
DESTINATION_REPO="https://x-access-token:$SECRET_TOKEN@github.com/${DESTINATION_REPO}.git"

echo "SOURCE=$SOURCE_REPO:$SOURCE_BRANCH"
echo "DESTINATION=$DESTINATION_REPO:$DESTINATION_BRANCH"

git clone "$SOURCE_REPO" /root/source --origin source && cd /root/source
ls
if [ ! -z "$IGNORE_FOLDER" ]
then
	git rm -rf $IGNORE_FOLDER ||:
	git commit . -m "Remove $IGNORE_FOLDER"
fi

git remote add destination "$DESTINATION_REPO"

# Pull all branches references down locally so subsequent commands can see them
git fetch source '+refs/heads/*:refs/heads/*' --update-head-ok

# Print out all branches
git --no-pager branch -a -vv


git push destination "${SOURCE_BRANCH}:${DESTINATION_BRANCH}" -f
