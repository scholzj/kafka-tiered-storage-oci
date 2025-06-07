FROM  registry.access.redhat.com/ubi9/ubi:latest AS build

ARG VERSION=latest
ARG PLUGIN=plugin

RUN mkdir tiered-storage
RUN curl -sL https://github.com/Aiven-Open/tiered-storage-for-apache-kafka/releases/download/v${VERSION}/core-${VERSION}.tgz | tar -xz  --strip-components=1 -C tiered-storage
RUN curl -sL https://github.com/Aiven-Open/tiered-storage-for-apache-kafka/releases/download/v${VERSION}/${PLUGIN}-${VERSION}.tgz | tar -xz  --strip-components=1 -C tiered-storage

FROM scratch

ARG VERSION=latest
ARG PLUGIN=plugin

LABEL org.opencontainers.image.source='https://github.com/scholzj/kafka-tiered-storage-oci' \
      org.opencontainers.image.url='https://github.com/scholzj/kafka-tiered-storage-oci' \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.title="Apache Kafka ${PLUGIN} tiered storage plugin" \
      org.opencontainers.image.description='Container images with the Apache Kafka ${PLUGIN} tiered storage plugin (from Aiven)'

COPY --from=build tiered-storage /