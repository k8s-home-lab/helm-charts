# youtubedl-material

![Version: 5.1.0](https://img.shields.io/badge/Version-5.1.0-informational?style=flat-square) ![AppVersion: 4.3.2](https://img.shields.io/badge/AppVersion-4.3.2-informational?style=flat-square)

Self-hosted YouTube downloader built on Material Design

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-home-lab/helm-charts/issues/new/choose)**

## Source Code

* <https://github.com/Tzahi12345/YoutubeDL-Material>
* <https://github.com/k8s-at-home/charts/tree/master/charts/youtubedl-material>

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
helm install youtubedl-material k8s-home-lab/youtubedl-material
```

## Installing the Chart

To install the chart with the release name `youtubedl-material`

```console
helm install youtubedl-material k8s-home-lab/youtubedl-material
```

## Uninstalling the Chart

To uninstall the `youtubedl-material` deployment

```console
helm uninstall youtubedl-material
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install youtubedl-material \
  --set env.TZ="America/New York" \
    k8s-home-lab/youtubedl-material
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install youtubedl-material k8s-home-lab/youtubedl-material -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [image repo](https://github.com/Tzahi12345/YoutubeDL-Material) for more details. |
| env.GID | string | `"568"` | Specify the group ID the application will run as |
| env.TZ | string | `"UTC"` | Set the container timezone |
| env.UID | string | `"568"` | Specify the user ID the application will run as |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"tzahi12345/youtubedl-material"` | image repository |
| image.tag | string | `nil` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 5.1.0

