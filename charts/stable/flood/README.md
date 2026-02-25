# flood

![Version: 7.1.0](https://img.shields.io/badge/Version-7.1.0-informational?style=flat-square) ![AppVersion: 4.12.6](https://img.shields.io/badge/AppVersion-4.12.6-informational?style=flat-square)

Flood is a monitoring service for various torrent clients

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-home-lab/helm-charts/issues/new/choose)**

## Source Code

* <https://github.com/jesec/flood>
* <https://hub.docker.com/r/jesec/flood>

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
helm install flood k8s-home-lab/flood
```

## Installing the Chart

To install the chart with the release name `flood`

```console
helm install flood k8s-home-lab/flood
```

## Uninstalling the Chart

To uninstall the `flood` deployment

```console
helm uninstall flood
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install flood \
  --set env.TZ="America/New York" \
    k8s-home-lab/flood
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install flood k8s-home-lab/flood -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See more environment variables in the [flood documentation] (https://github.com/jesec/flood/blob/v4.6.0/config.ts) Note: The environmental variables are not case sensitive (e.g. FLOOD_OPTION_port=FLOOD_OPTION_PORT). |
| env.FLOOD_OPTION_RUNDIR | string | `"/data"` | Where to store Flood's runtime files (eg. database) |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"jesec/flood"` | image repository |
| image.tag | string | `nil` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 7.1.0

