# Capstone_Project

[![lqtoan20](https://circleci.com/gh/lqtoan20/devops-capstone-project.svg?style=svg)](https://app.circleci.com/pipelines/github/lqtoan20/devops-capstone-project)

Link to verify:

http://a7bb18763788e46d791e8b9538f66622-1654461492.us-east-1.elb.amazonaws.com/

# Udacity Capstone Project

In this project you will apply the skills and knowledge which were developed throughout the Cloud DevOps Nanodegree program. These include:

Working in AWS
Using Jenkins or Circle CI to implement Continuous Integration and Continuous Deployment
Building pipelines
Working with Ansible and CloudFormation to deploy clusters
Building Kubernetes clusters
Building Docker containers in pipelines

## Environment Variables

To run this project, you will need to add the following environment variables to your CircleCI environment variables

- `AWS_DEFAULT_REGION`
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_DEFAULT_REGION`
- `DOCKER_PASSWORD`
- `DOCKER_USERNAME`

## Folder structure

| File                   | Description                                               |
| ---------------------- | --------------------------------------------------------- |
| `.circleci/config.yml` | CircleCI configuration                                    |
| `cloudformation`       | CloudFormation yaml templates for creating infrastructure |
| `kubernetes`           | Kubernetes resource files                                 |
| `app.py`               | main application to answer request                        |
| `Dockerfile`           | Dockerfile to build image                                 |
| `screenshots`          | Include all images                                        |

## Run Steps For Cloud Deployment

- Run `./run-network.sh create` to create VPC infrastructure
- Run `./run-cluster.sh create` to create EKS cluster
- Run `./run-nodegroup.sh create` to create EKS nodes group
