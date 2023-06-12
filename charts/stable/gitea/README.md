# gitea

![Version: 2.0.2](https://img.shields.io/badge/Version-2.0.2-informational?style=flat-square) ![AppVersion: 1.16.6](https://img.shields.io/badge/AppVersion-1.16.6-informational?style=flat-square)

Gitea self-hosted github-styled git repository manager

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-home-lab/helm-charts/issues/new/choose)**

## Source Code

* <https://github.com/go-gitea/gitea>
* <https://github.com/k8s-home-lab/helm-charts/tree/master/charts/stable/gitea>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mariadb | 11.5.6 |
| https://charts.bitnami.com/bitnami | postgresql | 12.2.7 |
| https://charts.bitnami.com/bitnami | redis | 17.9.3 |
| https://library-charts.k8s-at-home.com | common | 4.5.2 |

## TL;DR

```console
helm repo add k8s-home-lab https://k8s-home-lab.github.io/helm-charts/
helm repo update
helm install gitea k8s-home-lab/gitea
```

## Installing the Chart

To install the chart with the release name `gitea`

```console
helm install gitea k8s-home-lab/gitea
```

## Uninstalling the Chart

To uninstall the `gitea` deployment

```console
helm uninstall gitea
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install gitea \
  --set env.TZ="America/New York" \
    k8s-home-lab/gitea
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install gitea k8s-home-lab/gitea -f values.yaml
```

## Custom configuration

Set Gitea parameters with:
```
config:
  GITEA__APP_NAME: "Gitea: Git with a cup of tea"
  GITEA__RUN_MODE: prod
  GITEA__repository__ROOT: /data/git/repositories
  GITEA__server__APP_DATA_PATH: /data/gitea
  GITEA__service__DISABLE_REGISTRATION: false
  GITEA__service__REQUIRE_SIGNIN_VIEW: false
```

All options can be found [here](https://docs.gitea.io/en-us/config-cheat-sheet/).

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| addons.codeserver | object | See values.yaml | The common library supports adding a code-server add-on to access files. It can be configured under this key. For more info, check out [our docs](http://docs.k8s-at-home.com/our-helm-charts/common-library-add-ons/#code-server) |
| addons.codeserver.args | list | `["--auth","none"]` | Set codeserver command line arguments. Consider setting --user-data-dir to a persistent location to preserve code-server setting changes |
| addons.codeserver.enabled | bool | `false` | Enable running a code-server container in the pod |
| addons.codeserver.env | object | `{}` | Set any environment variables for code-server here |
| addons.codeserver.git | object | See below | Optionally allow access a Git repository by passing in a private SSH key |
| addons.codeserver.git.deployKey | string | `""` | Raw SSH private key |
| addons.codeserver.git.deployKeyBase64 | string | `""` | Base64-encoded SSH private key. When both variables are set, the raw SSH key takes precedence. |
| addons.codeserver.git.deployKeySecret | string | `""` | Existing secret containing SSH private key The chart expects it to be present under the `id_rsa` key. |
| addons.codeserver.image.pullPolicy | string | `"IfNotPresent"` | Specify the code-server image pull policy |
| addons.codeserver.image.repository | string | `"codercom/code-server"` | Specify the code-server image |
| addons.codeserver.image.tag | string | `"4.12.0"` | Specify the code-server image tag |
| addons.codeserver.ingress.enabled | bool | `false` | Enable an ingress for the code-server add-on. |
| addons.codeserver.ingress.labels | object | `{}` |  kubernetes.io/tls-acme: "true" |
| addons.codeserver.service.enabled | bool | `true` | Enable a service for the code-server add-on. |
| addons.codeserver.service.ipFamilies | list | `["IPv4"]` | The ip families that should be used. Options: IPv4, IPv6 |
| addons.codeserver.service.ipFamilyPolicy | string | `"SingleStack"` | Specify the ip policy. Options: SingleStack, PreferDualStack, RequireDualStack |
| addons.codeserver.volumeMounts | list | `[]` | Specify a list of volumes that get mounted in the code-server container. At least 1 volumeMount is required! |
| addons.codeserver.workingDir | string | `""` | Specify the working dir that will be opened when code-server starts If not given, the app will default to the mountpah of the first specified volumeMount |
| config | string | See https://docs.gitea.io/en-us/config-cheat-sheet/ | gitea specific configuration keys. Must be formatted as GITEA__[section]__variable |
| env | object | See below | environment variables. See more environment variables in the [gitea documentation](https://gitea.org/docs). |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"gitea/gitea"` | image repository |
| image.tag | string | `nil` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| mariadb | object | See values.yaml | Enable and configure mariadb database subchart under this key.    For more options see [mariadb chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/mariadb) |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| postgresql | object | See values.yaml | Enable and configure postgresql database subchart under this key.    For more options see [postgresql chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/postgresql) |
| redis | object | See values.yaml | Enable and configure redis subchart under this key.    For more options see [redis chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/redis) |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 2.0.2

#### Added

N/A

#### Changed

* Update docker image codercom/code-server to 4.12.0

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-home-lab-helm-charts/gitea?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-home-lab/helm-charts/issues/new/choose)

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
