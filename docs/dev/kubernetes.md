# Kubernetes

- [Resource Types Overview](#resource-types-overview)
- [Local Development](#local-development)
- [Useful Tools](#useful-tools)

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

The following documents options available to run Kubernetes on a local machine.

### Kubernetes-in-Docker (KIND)

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

Run the following from the same directory as the `kind-config.yaml` file

```sh
kind create cluster --config ./kind-config.yaml;
```

### Microk8s

`TODO`

### Minikube

`TODO`

- - -

## Useful Tools

- [k9s](https://github.com/derailed/k9s)
