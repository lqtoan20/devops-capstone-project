#!/bin/bash

ACTION=$1
STACK="capstone-devops-eks-network"
TEMPLATE="network.yml"
PARAMS="network-params.json"

./run-stack.sh $ACTION $STACK $TEMPLATE $PARAMS