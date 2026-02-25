# flaresolverr

![Version: 6.1.0](https://img.shields.io/badge/Version-6.1.0-informational?style=flat-square) ![AppVersion: v3.4.6](https://img.shields.io/badge/AppVersion-v3.4.6-informational?style=flat-square)

FlareSolverr is a proxy server to bypass Cloudflare protection

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-home-lab/helm-charts/issues/new/choose)**

## Source Code

* <https://github.com/FlareSolverr/FlareSolverr>
* <https://hub.docker.com/r/flaresolverr/flaresolverr>

## Requirements

Kubernetes: `>=1.32.0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://k8s-home-lab.github.io/helm-charts/ | common | 4.5.3 |

## TL;DR

```console
helm repo add k8s-home-lab https://k8s-home-lab.github.io/helm-charts/
helm repo update
helm install flaresolverr k8s-home-lab/flaresolverr
```

## Installing the Chart

To install the chart with the release name `flaresolverr`

```console
helm install flaresolverr k8s-home-lab/flaresolverr
```

## Uninstalling the Chart

To uninstall the `flaresolverr` deployment

```console
helm uninstall flaresolverr
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install flaresolverr \
  --set env.TZ="America/New York" \
    k8s-home-lab/flaresolverr
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install flaresolverr k8s-home-lab/flaresolverr -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See more environment variables in the [flaresolverr documentation](https://github.com/FlareSolverr/FlareSolverr#environment-variables). |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/flaresolverr/flaresolverr"` | image repository |
| image.tag | string | `nil` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 6.1.0

