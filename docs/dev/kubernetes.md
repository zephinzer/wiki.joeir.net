# Kubernetes

- [Resource Types Overview](#resource-types-overview)
- [Local Development](#local-development)
- [Useful Tools](#useful-tools)
- [Community Events](#community-events)


- - -


## Resource Types Overview

### ConfigMap

- Mountable as a volume in a Pod

### Containers

- Containers are the most atomic compute instance
- Containers are basically sandboxed applications running in a Pod

### Deployments

### Ingress

### Pod

- A Pod contains one or more Containers
- All Containers in a Pod can address each other via `localhost`
- Every Pod has a unique IP address
- Pods basically represent a virtual machine (VM)

### Persistent Volume

### Persistent Volume Claim

### Replica Sets

### Secret

- Mountable as a volume in a Pod
- Base64 encoded, **not encrypted**

### Services

- 3 types of services: `LoadBalanced`, `NodePort`, `ClusterIP`


- - -


## Local Development

The following documents options available to run Kubernetes on a local machine. Primarily, they are:

- [Kubernetes-in-Docker (KIND)](#kubernetes-in-docker-kind)
- [Microk8s](#microk8s)
- [Minikube](#minikube)

### Kubernetes-in-Docker (KIND)

- [Github Repository](https://github.com/kubernetes-sigs/kind)

#### Simple Setup

```sh
kind create cluster;
```

#### Named Cluster

```sh
kind create cluster --name mycluster;
```

#### Multi-Node Cluster Configuration

Place the following in a `kind-config.yaml` file:

```yaml
apiVersion: kind.sigs.k8s.io/v1alpha3
kind: Cluster
nodes:
- role: control-plane
- role: worker
- role: worker
```

Run the following from the same directory as the `kind-config.yaml` file:

```sh
kind create cluster --config ./kind-config.yaml;
```

#### Loading Local Image Into Cluster

```sh
kind load docker-image ___;
```

### Microk8s

- [Main Website](https://microk8s.io/)
- [Github Repository](https://github.com/ubuntu/microk8s)

### Minikube

- [Main Website](https://minikube.sigs.k8s.io/)
- [Github Repository](https://github.com/kubernetes/minikube)


- - -


## Useful Tools

### CLI

- [k9s](https://github.com/derailed/k9s)

### VSCode

| Name | Description | Link |
| --- | --- | --- |
| Docker | Adds syntax highlighting, commands, hover tips, and linting for Dockerfile and docker-compose files. | [https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
| Kubernetes | Develop, deploy and debug Kubernetes applications | [https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools](https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools) |


- - -


## Community Events

### Global

- [Kubecon North America](https://events.linuxfoundation.org/kubecon-cloudnativecon-north-america/)
- [Kubecon Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/)

### Singapore

- [Singapore Kubernetes User Group](https://www.meetup.com/en-SG/Singapore-Kubernetes-User-Group/)
