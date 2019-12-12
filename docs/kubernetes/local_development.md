# Kubernetes: Local Development

## Kubernetes-in-Docker (KIND)

### Multi-Node Cluster Configuration

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

