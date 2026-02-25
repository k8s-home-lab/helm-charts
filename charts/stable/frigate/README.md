# frigate

![Version: 9.1.0](https://img.shields.io/badge/Version-9.1.0-informational?style=flat-square) ![AppVersion: 0.11.1](https://img.shields.io/badge/AppVersion-0.11.1-informational?style=flat-square)

NVR With Realtime Object Detection for IP Cameras

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-home-lab/helm-charts/issues/new/choose)**

## Source Code

* <https://github.com/blakeblackshear/frigate>

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
helm install frigate k8s-home-lab/frigate
```

## Installing the Chart

To install the chart with the release name `frigate`

```console
helm install frigate k8s-home-lab/frigate
```

## Uninstalling the Chart

To uninstall the `frigate` deployment

```console
helm uninstall frigate
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install frigate \
  --set env.TZ="America/New York" \
    k8s-home-lab/frigate
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install frigate k8s-home-lab/frigate -f values.yaml
```

## Custom configuration

### Frigate database directory

It is recommended to set a separate database directory for Frigate.

For example:

```yaml
persistence:
  data:
    enabled: true
    mountPath: /data
    # ...
config: |
  # ...
  database:
    path: /data/frigate.db
  # ...
```

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity constraint rules to place the Pod on a specific node. [[ref]](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) |
| configmap.config.data | object | see URL to default config | See [docs](https://blakeblackshear.github.io/frigate/) for more details. |
| configmap.config.enabled | bool | `true` | Store frigate configuration as a ConfigMap |
| env | object | See below | environment variables. See [docs](https://blakeblackshear.github.io/frigate/) for more details. |
| env.FRIGATE_RTSP_PASSWORD | string | empty | Set a RTSP password |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"blakeblackshear/frigate"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| persistence.cache | object | See values.yaml | Configure a temporary cache. See [docs](https://blakeblackshear.github.io/frigate/) for more details.. |
| persistence.usb | object | See values.yaml | Configure a hostPathMount to mount a USB device in the container. |
| resources | object | `{}` | Configure the resource requests and/or limits for the Pod |
| securityContext.privileged | bool | `false` | Privileged securityContext may be required if USB devices are accessed directly through the host machine |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 9.1.0

