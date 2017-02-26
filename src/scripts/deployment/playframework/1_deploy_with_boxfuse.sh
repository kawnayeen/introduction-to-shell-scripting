#!/usr/bin/env bash
REMOTE_NAME=$1
REMOTE_BRANCH=$2
APP_NAME=$3
DEPLOYMENT_STAGE=$4

EXTENSION="-1.0.zip"
CURRENT_TIME=$(date +%s)
GENERATED_ARTIFACT=${APP_NAME}${EXTENSION}
RENAMED_ARTIFACT="${APP_NAME}-${CURRENT_TIME}.zip"
FUSED_IMAGE_NAME="${APP_NAME}:${CURRENT_TIME}"

echo "Deploying ${REMOTE_BRANCH} branch of ${REMOTE_NAME} at ${DEPLOYMENT_STAGE}"

echo
echo "Updating local repository from remote"
git checkout ${REMOTE_BRANCH}
git pull ${REMOTE_NAME} ${REMOTE_BRANCH}
echo "Done with updating local repository"

echo
echo "packaging artifact"
activator dist
echo "done with packaging artifact"

echo
echo "Renaming artifact"
mv target/universal/${GENERATED_ARTIFACT} target/universal/${RENAMED_ARTIFACT}
echo "done with renaming artifact"

echo
echo "Clearing All local images"
boxfuse rm ${APP_NAME}
echo "Done with clearing local images"

echo
echo "Fusing Image"
boxfuse fuse target/universal/${RENAMED_ARTIFACT}
echo "done with fusing image"

echo
echo "Deploying At Prod"
boxfuse run ${FUSED_IMAGE_NAME} -env=prod
echo "Done with deploying at prod"