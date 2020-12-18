# Kubernetes Reflector

This module deploys [`kubernetes-reflector`](https://github.com/emberstack/kubernetes-reflector)
using Terraform via Helm onto a Kubernetes Cluster.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| helm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| affinity | Pod affinity | `map` | `{}` | no |
| chart\_name | Helm chart name to provision | `string` | `"reflector"` | no |
| chart\_namespace | Namespace to install the chart into | `string` | `"default"` | no |
| chart\_repository | Helm repository for the chart | `string` | `"https://emberstack.github.io/helm-charts"` | no |
| chart\_timeout | Timeout to wait for the Chart to be deployed. | `number` | `300` | no |
| chart\_version | Version of Chart to install. Set to empty to install the latest version | `string` | `"5.4.17"` | no |
| image\_repository | Image repository | `string` | `"emberstack/kubernetes-reflector"` | no |
| image\_tag | Image tag. Defaults to Chart version if unspecified | `string` | `""` | no |
| liveness\_probe | Liveness probe configuration | `map` | <pre>{<br>  "initialDelaySeconds": 5,<br>  "periodSeconds": 10<br>}</pre> | no |
| max\_history | Max History for Helm | `number` | `20` | no |
| pod\_fs\_group | fsGroup for Pod Security Context | `number` | `2000` | no |
| rbac\_enabled | Create RBAC resources | `bool` | `true` | no |
| readiness\_probe | Readiness probe configuration | `map` | <pre>{<br>  "initialDelaySeconds": 5,<br>  "periodSeconds": 10<br>}</pre> | no |
| release\_name | Helm release name | `string` | `"reflector"` | no |
| replica | Number of replica of reflector | `number` | `1` | no |
| resources | Resources for pod | `map` | <pre>{<br>  "limits": {<br>    "cpu": "100m",<br>    "memory": "256Mi"<br>  },<br>  "requests": {<br>    "cpu": "100m",<br>    "memory": "256Mi"<br>  }<br>}</pre> | no |
| security\_context | Security context for the container | `map` | <pre>{<br>  "capabilities": {<br>    "drop": [<br>      "ALL"<br>    ]<br>  },<br>  "readOnlyRootFilesystem": false,<br>  "runAsNonRoot": true,<br>  "runAsUser": 1000<br>}</pre> | no |
| service\_account\_annotations | Annotations for service account | `map` | `{}` | no |
| service\_account\_create | Create service account | `bool` | `true` | no |
| service\_account\_name | Override service account name | `string` | `""` | no |
| tolerations | Pod tolerations | `list` | `[]` | no |

## Outputs

No output.
