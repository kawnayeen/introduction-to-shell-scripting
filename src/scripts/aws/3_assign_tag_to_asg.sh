#!/usr/bin/env bash
ASG_NAME="asg-name"
TAG_KEY="app"
TAG_VALUE="sampleValue"
aws autoscaling create-or-update-tags --tags "ResourceId=${ASG_NAME},ResourceType=auto-scaling-group,Key=${TAG_KEY},Value=${TAG_VALUE},PropagateAtLaunch=true"