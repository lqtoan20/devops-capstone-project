#!/bin/bash

ACTION=$1
STACK="capstone-devops-eks-node-group"
TEMPLATE="nodegroup.yml"
PARAMS="nodegroup_params.json"

./run-stack.sh $ACTION $STACK $TEMPLATE $PARAMS