# Container images with the Apache Kafka tiered storage plugins

This repository contains set of container images with the Apache Kafka [tiered storage plugins from Aiven](https://github.com/Aiven-Open/tiered-storage-for-apache-kafka).
These container images should allow you to use it with Strimzi 0.47 and newer using the Kubernetes Image Volumes.
The tag of the container specifies the type of the plugin it contains and its version.

| Plugin               | Container image                                             |
|----------------------|-------------------------------------------------------------|
| Filesystem           | `ghcr.io/scholzj/kafka-tiered-storage-oci:1.0.0-filesystem` |
| Amazon S3            | `ghcr.io/scholzj/kafka-tiered-storage-oci:1.0.0-s3`         |
| Google Cloud Storage | `ghcr.io/scholzj/kafka-tiered-storage-oci:1.0.0-gcs`        |
| Azure Blob Storage   | `ghcr.io/scholzj/kafka-tiered-storage-oci:1.0.0-azure`      |

## Example `Kafka` custom resource

The following examples show how to mount the plugin into the Strimzi deployment.
Either through the `Kafka` CR:

```yaml
kind: Kafka
metadata:
  name: my-cluster
spec:
  kafka:
    # ...
    template:
      pod:
        volumes:
          - name: tiered-storage-plugin
            image:
              reference: ghcr.io/scholzj/kafka-tiered-storage-oci:1.0.0-filesystem
      kafkaContainer:
        volumeMounts:
          - name: tiered-storage-plugin
            mountPath: /mnt/tiered-storage-plugin
```

Or through the `KafkaNodePool` CR:

```yaml
kind: KafkaNodePool
metadata:
  name: broker
spec:
  # ...
  template:
    pod:
      volumes:
        - name: tiered-storage-plugin
          image:
            reference: ghcr.io/scholzj/kafka-tiered-storage-oci:1.0.0-filesystem
    kafkaContainer:
      volumeMounts:
        - name: tiered-storage-plugin
          mountPath: /mnt/tiered-storage-plugin
```
