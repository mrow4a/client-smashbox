#!/usr/bin/env bash

SMASHBOX_URL=localhost/octest
SMASHBOX_USERNAME=admin
SMASHBOX_PASSWORD=admin
CLIENT_BRANCH=fix_5855_v2

# Define test set
array=( \
#    reshareDir \
#    scrapeLogFile \
#    shareDir \
#    shareFile \
#    shareGroup \
#    sharePermissions \
#    uploadFiles \
    basicSync \
    concurrentDirRemove \
    shareLink \
    shareMountInit \
    sharePropagationGroups \
    sharePropagationInsideGroups \
    chunking \
    nplusone \
)

# Define which branch to build
#docker build \
#  --build-arg VERSION=${CLIENT_BRANCH} \
#  --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
#  --build-arg VCS_REF=$(git rev-parse --short HEAD) \
#  -t smashbox-runner . > result.txt 2>&1

# Run each test
for TEST_NAME in "${array[@]}"
do
	docker rm smashbox-runner >> result.txt 2>&1
    docker run -ti \
        --network="host" \
        --name smashbox-runner \
        -e SMASHBOX_URL=${SMASHBOX_URL} \
        -e SMASHBOX_USERNAME=${SMASHBOX_USERNAME}  \
        -e SMASHBOX_PASSWORD=${SMASHBOX_PASSWORD}  \
        -e SMASHBOX_WAIT=true  \
        -e SMASHBOX_TEST_NAME=${TEST_NAME}  \
        -e SMASHBOX_CHECK_URL=${SMASHBOX_URL}/status.php \
        owncloud/smashbox-runner:latest >> result.txt 2>&1
done





