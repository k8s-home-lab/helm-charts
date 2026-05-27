# zilean

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![AppVersion: 3.5.0](https://img.shields.io/badge/AppVersion-3.5.0-informational?style=flat-square)

zilean is a service that allows you to search for DebridMediaManager sourced content

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-home-lab/helm-charts/issues/new/choose)**

## Source Code

* <https://github.com/iPromKnight/zilean>
* <https://github.com/k8s-home-lab/helm-charts/tree/master/charts/stable/zilean>

## Requirements

Kubernetes: `>=1.32.0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://k8s-home-lab.github.io/helm-charts/ | common | 4.5.5 |
| oci://ghcr.io/cloudpirates-io/helm-charts | postgres | 0.16.0 |

## TL;DR

```console
helm repo add k8s-home-lab https://k8s-home-lab.github.io/helm-charts/
helm repo update
helm install zilean k8s-home-lab/zilean
```

## Installing the Chart

To install the chart with the release name `zilean`

```console
helm install zilean k8s-home-lab/zilean
```

## Uninstalling the Chart

To uninstall the `zilean` deployment

```console
helm uninstall zilean
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-home-lab/helm-charts/blob/master/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-home-lab/helm-charts/tree/master/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install zilean \
  --set env.TZ="America/New York" \
    k8s-home-lab/zilean
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install zilean k8s-home-lab/zilean -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-home-lab/helm-charts/tree/master/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See more environment variables in the [zilean documentation](https://zilean.org/docs). |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ipromknight/zilean"` | image repository |
| image.tag | string | `nil` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| postgresql | object | See values.yaml | Enable and configure postgresql database subchart under this key.    For more options see [postgresql chart documentation](https://github.com/CloudPirates-io/helm-charts/tree/main/charts/postgres) |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 1.0.0

