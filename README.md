# Container images with the Apache Kafka tiered storage plugins

This repository contains set of container images with the Apache Kafka [tiered storage plugins from Aiven](https://github.com/Aiven-Open/tiered-storage-for-apache-kafka).
These container images should allow you to use it with Strimzi 0.47 and newer using the Kubernetes Image Volumes.

| Plugin               | Container image                                             |
|----------------------|-------------------------------------------------------------|
| Filesystem           | `ghcr.io/scholzj/kafka-tiered-storage-oci:1.0.0-filesystem` |
| Amazon S3            | `ghcr.io/scholzj/kafka-tiered-storage-oci:1.0.0-s3`         |
| Google Cloud Storage | `ghcr.io/scholzj/kafka-tiered-storage-oci:1.0.0-gcs`        |
| Azure Blob Storage   | `ghcr.io/scholzj/kafka-tiered-storage-oci:1.0.0-azure`      |

## Example `Kafka` custom resource

TODO