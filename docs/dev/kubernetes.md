# Kubernetes

- [Resource Types Overview](#resource-types-overview)
- [Local Development](#local-development)
- [Useful Tools](#useful-tools)

- - -

## Resource Types Overview

### Containers

- Containers are the most atomic compute instance

### Pod

- A pod contains one or more containers
- All containers can address each other via `localhost`
- Every pod has a unique IP address

### Replica Sets

### Deployments

### Services

- 3 types of services: `LoadBalanced`, `NodePort`, `ClusterIP`

### Ingress

### ConfigMap

- Mountable as a volume in a Pod

### Secret

- Mountable as a volume in a Pod
- Base64 encoded, **not encrypted**

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
