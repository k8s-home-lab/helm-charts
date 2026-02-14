# rdt-client

![Version: 1.1.2](https://img.shields.io/badge/Version-1.1.2-informational?style=flat-square) ![AppVersion: 2.0.120](https://img.shields.io/badge/AppVersion-2.0.120-informational?style=flat-square)

rdt-client helm package

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-home-lab/helm-charts/issues/new/choose)**

## Source Code

* <https://github.com/rogerfar/rdt-client>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.5.2 |

## TL;DR

```console
helm repo add k8s-home-lab https://k8s-home-lab.github.io/helm-charts/
helm repo update
helm install rdt-client k8s-home-lab/rdt-client
```

## Installing the Chart

To install the chart with the release name `rdt-client`

```console
helm install rdt-client k8s-home-lab/rdt-client
```

## Uninstalling the Chart

To uninstall the `rdt-client` deployment

```console
helm uninstall rdt-client
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install rdt-client \
  --set env.TZ="America/New York" \
    k8s-home-lab/rdt-client
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install rdt-client k8s-home-lab/rdt-client -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See more environment variables in the [rdt-client documentation](https://rdt-client.org/docs). |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/rogerfar/rdtclient"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| podSecurityContext.fsGroup | int | `911` |  |
| podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 1.1.2

