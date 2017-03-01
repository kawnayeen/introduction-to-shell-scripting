#!/usr/bin/env bash
echo "Default first argument is the full path of this shell script"
echo $0
echo "Extracting directory name"
BASEDIR=$(dirname ${0})
echo ${BASEDIR}