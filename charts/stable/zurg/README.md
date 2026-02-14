# zurg

![Version: 1.1.0](https://img.shields.io/badge/Version-1.1.0-informational?style=flat-square) ![AppVersion: v0.9.3-final](https://img.shields.io/badge/AppVersion-v0.9.3--final-informational?style=flat-square)

A self-hosted Real-Debrid webdav server

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-home-lab/helm-charts/issues/new/choose)**

## Source Code

* <https://github.com/debridmediamanager/zurg-testing>

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
helm install zurg k8s-home-lab/zurg
```

## Installing the Chart

To install the chart with the release name `zurg`

```console
helm install zurg k8s-home-lab/zurg
```

## Uninstalling the Chart

To uninstall the `zurg` deployment

```console
helm uninstall zurg
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install zurg \
  --set env.TZ="America/New York" \
    k8s-home-lab/zurg
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install zurg k8s-home-lab/zurg -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config | string | see URL to default config | Full list of options https://github.com/debridmediamanager/zurg-testing/wiki/Config-v0.9 |
| env | object | See below | environment variables. See more environment variables in the [zurg documentation](https://zurg.org/docs). |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/debridmediamanager/zurg-testing"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. # Config persistence is required for the Prometheus exporter sidecar. |
| probes | object | See values.yaml | Configures the probes for the main Pod. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 1.1.0

