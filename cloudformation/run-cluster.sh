#!/bin/bash

ACTION=$1
STACK="capstone-devops-eks-cluster"
TEMPLATE="cluster.yml"
PARAMS="cluster-params.json"

./run-stack.sh $ACTION $STACK $TEMPLATE $PARAMS