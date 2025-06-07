FROM  registry.access.redhat.com/ubi9/ubi:latest AS build

ARG VERSION=latest

RUN mkdir tiered-storage
RUN curl -sL https://github.com/Aiven-Open/tiered-storage-for-apache-kafka/releases/download/v${VERSION}/core-${VERSION}.tgz | tar -xz  --strip-components=1 -C tiered-storage
RUN curl -sL https://github.com/Aiven-Open/tiered-storage-for-apache-kafka/releases/download/v${VERSION}/filesystem-${VERSION}.tgz | tar -xz  --strip-components=1 -C tiered-storage

FROM scratch

ARG VERSION=latest

LABEL org.opencontainers.image.source='https://github.com/scholzj/kafka-tiered-storage-oci' \
      org.opencontainers.image.url='https://github.com/scholzj/kafka-tiered-storage-oci' \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.description='Container images with the Apache Kafka tiered storage plugins (from Aiven)'

COPY --from=build tiered-storage /