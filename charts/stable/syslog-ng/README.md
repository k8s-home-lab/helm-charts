# syslog-ng

![Version: 3.1.0](https://img.shields.io/badge/Version-3.1.0-informational?style=flat-square) ![AppVersion: 4.10.2](https://img.shields.io/badge/AppVersion-4.10.2-informational?style=flat-square)

syslog-ng allows you to flexibly collect, parse, classify, rewrite and correlate logs.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-home-lab/helm-charts/issues/new/choose)**

## Source Code

* <https://hub.docker.com/r/linuxserver/syslog-ng>

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
helm install syslog-ng k8s-home-lab/syslog-ng
```

## Installing the Chart

To install the chart with the release name `syslog-ng`

```console
helm install syslog-ng k8s-home-lab/syslog-ng
```

## Uninstalling the Chart

To uninstall the `syslog-ng` deployment

```console
helm uninstall syslog-ng
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install syslog-ng \
  --set env.TZ="America/New York" \
    k8s-home-lab/syslog-ng
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install syslog-ng k8s-home-lab/syslog-ng -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See more environment variables in the [syslog-ng documentation](https://syslog-ng.org/docs). |
| env.PGID | string | `"568"` | Set the container group id |
| env.PUID | string | `"568"` | Set the container user id |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/linuxserver/syslog-ng"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 3.1.0

