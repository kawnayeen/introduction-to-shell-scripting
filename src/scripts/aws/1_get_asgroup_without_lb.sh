#!/usr/bin/env bash
INTERNAL_SERVICES_LB="InternalServiceLB"

ALL_SCALING_GROUP=($(aws autoscaling describe-auto-scaling-groups --query 'AutoScalingGroups[?HealthCheckType == `EC2`].AutoScalingGroupName' --output text))

echo "Array size: ${#ALL_SCALING_GROUP[*]}"

for SCALING_GROUP in "${ALL_SCALING_GROUP[@]}"
    do
        aws autoscaling attach-load-balancers --auto-scaling-group-name ${SCALING_GROUP} --load-balancer-names ${INTERNAL_SERVICES_LB}
        aws autoscaling update-auto-scaling-group --auto-scaling-group-name ${SCALING_GROUP} --health-check-type ELB --health-check-grace-period 60
done