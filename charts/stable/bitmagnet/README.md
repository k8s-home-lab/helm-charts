# bitmagnet

![Version: 1.0.2](https://img.shields.io/badge/Version-1.0.2-informational?style=flat-square) ![AppVersion: v0.10](https://img.shields.io/badge/AppVersion-v0.10-informational?style=flat-square)

bitmagnet is a BitTorrent indexer, DHT crawler, content classifier and torrent search engine

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-home-lab/helm-charts/issues/new/choose)**

## Source Code

* <https://github.com/bitmagnet-io/bitmagnet>
* <https://github.com/k8s-home-lab/helm-charts/tree/master/charts/stable/bitmagnet>

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
helm install bitmagnet k8s-home-lab/bitmagnet
```

## Installing the Chart

To install the chart with the release name `bitmagnet`

```console
helm install bitmagnet k8s-home-lab/bitmagnet
```

## Uninstalling the Chart

To uninstall the `bitmagnet` deployment

```console
helm uninstall bitmagnet
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-home-lab/helm-charts/blob/master/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-home-lab/helm-charts/tree/master/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install bitmagnet \
  --set env.TZ="America/New York" \
    k8s-home-lab/bitmagnet
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install bitmagnet k8s-home-lab/bitmagnet -f values.yaml
```

## Custom configuration

POSTGRES_HOST, POSTGRES_NAME POSTGRES_USER POSTGRES_PASSWORD (default: localhost, bitmagnet, postgres, empty): Set these values to configure connection to your Postgres database.
POSTGRES_DSN: Alternatively a Postgres Data Source Name (DSN) can be specified. If specified, all other postgres.* options are ignored.
TMDB_API_KEY: This is quite an important one, please see below for more details.
TMDB_ENABLED (default: true): Specify false to disable the TMDB API integration.
DHT_CRAWLER_SAVE_FILES_THRESHOLD (default: 100): Some torrents contain many thousands of files, which impacts performance and uses a lot of database disk space. This parameter sets a maximum limit for the number of files saved by the crawler with each torrent.
DHT_CRAWLER_SAVE_PIECES (default: false): If true, the DHT crawler will save the pieces bytes from the torrent metadata. The pieces take up quite a lot of space, and aren’t currently very useful, but they may be used by future features.
LOG_LEVEL (default: info): If you’re developing or just curious then you may want to set this to debug; note that debug output will be very verbose.
LOG_DEVELOPMENT (default: false): If you’re developing you may want to enable this flag to enable more verbose output such as stack traces.
LOG_JSON (default: false): By default logs are output in a pretty format with colors; enable this flag if you’d prefer plain JSON.
LOG_FILE_ROTATOR_ENABLED (default: false): If true, logs will be output to rotating log files at level LOG_FILE_ROTATOR_LEVEL in the LOG_FILE_ROTATOR_PATH directory, allowing forwarding to a logs aggregator (see the observability guide).
HTTP_SERVER_OPTIONS (default ["*"]): A list of enabled HTTP server components. By default all are enabled. Components include: cors, pprof, graphql, import, prometheus, torznab, status, webui.
DHT_CRAWLER_SCALING_FACTOR (default: 10): There are various rate and concurrency limits associated with the DHT crawler. This parameter is a rough proxy for resource usage of the crawler; concurrency and buffer size of the various pipeline channels are multiplied by this value. Diminishing returns may result from exceeding the default value of 10. Since the software has not been tested on a wide variety of hardware and network conditions your mileage may vary here…
PROCESSOR_CONCURRENCY (default: 1): Defines the maximum number of torrents to be processed/classified simultaneously. The default setting of 1 aims to support the widest range of systems. Increasing the setting (for example to 3) may improve throughput of the processor queue but is known to cause slowdowns on less powerful systems.

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-home-lab/helm-charts/tree/master/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| args[0] | string | `"--keys=http_server"` |  |
| args[1] | string | `"--keys=queue_server"` |  |
| args[2] | string | `"--keys=dht_crawler"` |  |
| command[0] | string | `"worker"` |  |
| command[1] | string | `"run"` |  |
| config | string | See https://bitmagnet.io/setup/configuration.html | bitmagnet specific configuration keys. |
| env | object | See below | environment variables. See more environment variables in the [bitmagnet documentation](https://bitmagnet.org/docs). |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/bitmagnet-io/bitmagnet"` | image repository |
| image.tag | string | `nil` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| postgresql | object | See values.yaml | Enable and configure postgresql database subchart under this key.    For more options see [postgresql chart documentation](https://github.com/CloudPirates-io/helm-charts/tree/main/charts/postgres) |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 1.0.2

