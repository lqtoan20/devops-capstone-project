git: https://github.com/lqtoan20/devops-capstone-project
link webapp: http://a7bb18763788e46d791e8b9538f66622-1654461492.us-east-1.elb.amazonaws.com/

More detail
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

| File                                   | Description                                               |
| -------------------------------------- | --------------------------------------------------------- |
| `.circleci/config.yml`                 | CircleCI configuration                                    |
| `cloudformation`                       | CloudFormation yaml templates for creating infrastructure |
| `cloudformation/network.yml`           | Template for network VPC                                  |
| `cloudformation/network-params.json`   | Network VPC params                                        |
| `cloudformation/cluster.yml`           | Template for EKS cluster                                  |
| `cloudformation/cluster-params.json`   | EKS cluster params                                        |
| `cloudformation/nodegroup.yml`         | Template for EKS nodes group                              |
| `cloudformation/nodegroup-params.json` | EKS nodes group params                                    |
| `cloudformation/run-network`           | Script to create VPC infrastructure                       |
| `cloudformation/run-cluster`           | Script to create EKS cluster                              |
| `cloudformation/run-nodegroup`         | Script to create EKS nodes group                          |
| `kubernetes`                           | Kubernetes resource files                                 |
| `kubernetes/deployment.yml`            | Kubernetes deployment declaration                         |
| `kubernetes/aws-auth.yml`              | Kubernetes configmap declaration                          |
| `react-application`                    | main application                                          |
| `nginx.conf`                           | nginx file config                                         |
| `Dockerfile`                           | Dockerfile to build image                                 |
| `screenshots`                          | Include all images                                        |

## Overview flow

- Create Dockerfile to build image - resource get from `react-application`
- Configure CircleCI - add `build-docker` job with 3 step:

```bash
  docker build -t capstone-devops ./react-application - run:
  docker tag capstone-devops lqtoan20/capstone-devops:v1 - run:
  docker login -u $DOCKER_USERNAME -p $DOCKER_PASS - run:
  docker push lqtoan20/capstone-devops:v1
```

- Configure CircleCI - add `deploy` job to auto update for cluster

## Run Steps For Cloud Deployment

- Run command `cd cloudformation`
- Run command `./run-network.sh create` to create VPC infrastructure
- Run command `./run-c.sh create` to create EKS cluster
- Run command `./run-nodegroup.sh create` to create EKS nodes group
- Verify result on CloudFomation Stack in AWS console

* Run `aws eks list-clusters --profile default` to see output like below
  `{
    "clusters": [
        "CapstoneEKS-bFAi3ZPducNe"
    ]
}` to get cluster name
* Replace cluster name in `./circleci/config.yml` - step `deploy`
* Configure CircleCI project for the github repository
* Done!

* Some kubectl commands to check k8s resources

```bash
    # Fet k8s configs
    aws eks --region us-east-1 update-kubeconfig --name CapstoneEKS-bFAi3ZPducNe
    # Switch context
    kubectl config use-context arn:aws:eks:us-east-1:097326127858:cluster/CapstoneEKS-bFAi3ZPducNe
    # See ndoes in cluster
    kubectl get nodes
    # See running pods
    kubectl get pods
    # See services
    kubectl get services
    # View logs of a pod (when checking incoming request)
    kubectl logs <POD_NAME>
    # Port forward to forward a port in pod to host port (format: <HOST_PORT><POD_PORT>)
    kubectl port-forward <HOST_PORT><POD_PORT>
```
