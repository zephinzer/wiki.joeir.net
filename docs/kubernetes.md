# Software Engineering / Tools / Kubernetes

- [Software Engineering / Tools / Kubernetes](#software-engineering--tools--kubernetes)
  - [Installation](#installation)
    - [Installation on Ubuntu](#installation-on-ubuntu)
  - [Local Development](#local-development)
    - [Kubernetes-in-Docker (KIND)](#kubernetes-in-docker-kind)
      - [Simple Setup](#simple-setup)
      - [Named Cluster](#named-cluster)
      - [Multi-Node Cluster Configuration](#multi-node-cluster-configuration)
      - [Loading Local Image Into Cluster](#loading-local-image-into-cluster)
    - [Microk8s](#microk8s)
    - [Minikube](#minikube)
  - [Resource Types Overview](#resource-types-overview)
    - [ConfigMap](#configmap)
      - [ConfigMap template for environment variables injection](#configmap-template-for-environment-variables-injection)
      - [ConfigMap template for volume mounting](#configmap-template-for-volume-mounting)
    - [Containers](#containers)
    - [Deployments](#deployments)
      - [Template for a Deployment resource type](#template-for-a-deployment-resource-type)
    - [Ingress](#ingress)
      - [Template for an Ingress resource type](#template-for-an-ingress-resource-type)
    - [Persistent Volume](#persistent-volume)
    - [Persistent Volume Claim](#persistent-volume-claim)
    - [Pod](#pod)
      - [Template for a static pod](#template-for-a-static-pod)
    - [Replica Sets](#replica-sets)
    - [Secret](#secret)
      - [Template for an opaque secret](#template-for-an-opaque-secret)
    - [Services](#services)
      - [Template for a service](#template-for-a-service)
  - [Debugging](#debugging)
    - [invalid object doesn't have additional properties](#invalid-object-doesnt-have-additional-properties)
  - [Useful Tools](#useful-tools)
    - [CLI](#cli)
    - [VSCode](#vscode)
  - [Community Events](#community-events)
    - [Global](#global)
    - [Singapore](#singapore)


- - -

## Installation

### Installation on Ubuntu

```sh
# add the gpg key
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add;

# add the ppa
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main";

# install kubectl
sudo apt-get install kubectl;

# install kubeadm
sudo apt-get install kubeadm;
```

If the above instructions fail, you can find the instructions for Ubuntu 18.04 here: [https://vitux.com/install-and-deploy-kubernetes-on-ubuntu/](https://vitux.com/install-and-deploy-kubernetes-on-ubuntu/)


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


## Resource Types Overview

### ConfigMap

- Mountable as a volume in a Pod

#### ConfigMap template for environment variables injection

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: template
data:
  CONFIG_VALUE_ONE: "1"
  CONFIG_VALUE_TWO: "two"
  CONFIG_VALUE_BOOL: "true"
```

#### ConfigMap template for volume mounting

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: template
data:
  some.json: |
    {
      "hello": "world",
      "i": 1,
      "to": "k8s"
    }
  some.yaml: |
    hello: world
    i: 1
    to: k8s
```

### Containers

- Containers are the most atomic compute instance
- Containers are basically sandboxed applications running in a Pod

### Deployments

#### Template for a Deployment resource type

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: template
  labels:
    app: template
    type: deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      name: echoserver
      type: pod
  template:
    metadata:
      name: echoserver
      labels:
        name: echoserver
        type: pod
    spec:
      containers:
      - name: echoserver
        image: zephinzer/demo-echoserver:latest
        imagePullPolicy: IfNotPresent
        ports:
        - name: pod-http
          containerPort: 11111
          protocol: TCP
        livenessProbe:
          httpGet:
            path: /healthz
            port: 11111
            httpHeaders:
            - name: X-Healthcheck
              value: LivenessProbe
          initialDelaySeconds: 15
          periodSeconds: 5
        readinessProbe:
          httpGet:
            path: /readyz
            port: 11111
            httpHeaders:
            - name: X-Healthcheck
              value: ReadinessProbe
          initialDelaySeconds: 15
          periodSeconds: 5
        resources:
          limits:
            cpu: 60m
            memory: 20Mi
          requests:
            cpu: 50m
            memory: 10Mi
```

### Ingress

#### Template for an Ingress resource type

```yaml
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: template
spec:
  rules:
  - host: testing.local
    http:
      paths:
      - path: /
        backend:
          serviceName: template
          servicePort: 11111
```

### Persistent Volume

### Persistent Volume Claim

### Pod

- A Pod contains one or more Containers
- All Containers in a Pod can address each other via `localhost`
- Every Pod has a unique IP address
- Pods basically represent a virtual machine (VM)

#### Template for a static pod

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: echoserver
  labels:
    name: echoserver
    type: template
spec:
  containers:
  - name: echoserver
    image: zephinzer/demo-echoserver:latest
    imagePullPolicy: IfNotPresent
    ports:
    - name: main-http
      containerPort: 11111
      protocol: TCP
    resources:
      limit:
        cpu: 60m
        memory: 20Mi
      request:
        cpu: 50m
        memory: 10Mi
```

### Replica Sets

### Secret

- Mountable as a volume in a Pod
- Base64 encoded, **not encrypted**

#### Template for an opaque secret

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: template
type: Opaque
data:
  SECRET_VALUE_ONE: MQ==
  SECRET_VALUE_TWO: dHdv
  SECRET_VALUE_BOOL: dHJ1ZQ==
```

### Services

- 3 `type`s of services: `LoadBalancer`, `NodePort`, `ClusterIP`

#### Template for a service

```yaml
apiVersion: v1
kind: Service
metadata:
  name: template
  labels:
    app: template
    type: service
spec:
  type: NodePort
  selector:
    name: echoserver
    type: pod
  ports:
    - port: 11111
      protocol: TCP
      name: service-http
      targetPort: pod-http
```


- - -



## Debugging

### invalid object doesn't have additional properties

`error: SchemaError(io.k8s.apimachinery.pkg.apis.meta.v1.APIGroup_v2): invalid object doesn't have additional properties`

- Check your `kubectl` version and confirm that the server/client version is compatible


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
