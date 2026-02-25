# readarr

![Version: 7.2.0](https://img.shields.io/badge/Version-7.2.0-informational?style=flat-square) ![AppVersion: 0.4.18](https://img.shields.io/badge/AppVersion-0.4.18-informational?style=flat-square)

A fork of Radarr to work with Books & AudioBooks

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-home-lab/helm-charts/issues/new/choose)**

## Source Code

* <https://github.com/Readarr/Readarr>
* <https://github.com/home-operations/containers>

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
helm install readarr k8s-home-lab/readarr
```

## Installing the Chart

To install the chart with the release name `readarr`

```console
helm install readarr k8s-home-lab/readarr
```

## Uninstalling the Chart

To uninstall the `readarr` deployment

```console
helm uninstall readarr
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install readarr \
  --set env.TZ="America/New York" \
    k8s-home-lab/readarr
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install readarr k8s-home-lab/readarr -f values.yaml
```

## Custom configuration

**Readarr is still in early development, and this chart will install a nightly build of Readarr.
[See the project readme for more information](https://github.com/Readarr/Readarr#readarr-is-in-early-stages-of-development-alphabeta-binary-builds-are-not-yet-available-use-of-any-test-builds-isnt-recommend-and-may-have-detrimental-effects-on-your-library). Take back-up's if you decide to use this on an existing library as the project is considered unstable**

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/home-operations/readarr"` | image repository |
| image.tag | string | `nil` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| probes | object | See values.yaml | Configures the probes for the main Pod. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 7.2.0

