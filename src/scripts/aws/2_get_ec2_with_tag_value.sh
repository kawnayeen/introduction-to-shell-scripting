#!/usr/bin/env bash
CONFIG_SERVER_IP=$(aws ec2 describe-instances --filters "Name=tag:boxfuse:image,Values=torgercarrycutcom/config-server:1487851304" --query 'Reservations[].Instances[].[PrivateIpAddress]' --output text)
echo ${CONFIG_SERVER_IP}
EUREKA_SERVER_IP=$(aws ec2 describe-instances --filters "Name=tag:boxfuse:app,Values=torgercarrycutcom/eureka-server" --query 'Reservations[].Instances[].[PrivateIpAddress]' --output text)
echo ${EUREKA_SERVER_IP}