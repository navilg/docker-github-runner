#!/usr/bin/env bash

set -e

url=$GHR_URL
token=$GHR_TOKEN

if [ -z $GHR_NAME ]; then
    echo "GHR_NAME is mandatory environment variable. Use this to give a name to runner."
    exit 1
fi

if [ -z $GHR_LABELS ]; then
    echo "GHR_LABELS is mandatory environment variable. Use this to give labels to runner."
    exit 1
fi

if [ -z $GHR_URL ]; then
    echo "GHR_URL is mandatory environment variable. Use this to provide github repo url. e.g. https://github.com/username/reponame"
    exit 1
fi

if [ -z $GHR_TOKEN ]; then
    echo "GHR_TOKEN is mandatory environment variable. Find token in Repo --> Settings --> Actions --> Runner --> Add new runner."
    exit 1
fi

if [ ! -f /actions-runner/.runner ]; then
    /runner/actions-runner/./config.sh --unattended --name $GHR_NAME --labels $GHR_LABELS --url $GHR_URL --token $GHR_TOKEN
fi

/runner/actions-runner/./run.sh
