#!/bin/sh
cd $GITHUB_WORKSPACE
git config --global --add safe.directory $GITHUB_WORKSPACE
git rev-parse $INPUT_BRANCH
if [ x$INPUT_IMAGE != x ]
then
  caprover deploy --caproverUrl $INPUT_SERVER --appToken $INPUT_TOKEN --appName $INPUT_APP -i $INPUT_IMAGE
elif [ x$INPUT_BRANCH != x ]
then
  caprover deploy --caproverUrl $INPUT_SERVER --appToken $INPUT_TOKEN --appName $INPUT_APP -b $INPUT_BRANCH
else
  caprover deploy --caproverUrl $INPUT_SERVER --appToken $INPUT_TOKEN --appName $INPUT_APP --tarFile ./deploy.tar
fi
