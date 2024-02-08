ARG BUILD_FROM=ghcr.io/hassio-addons/base:15.0.6

FROM $BUILD_FROM

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION
ARG FRP_VERSION

# Copy root filesystem
COPY rootfs /

# Setup base
RUN apk add --no-cache wget tar
    
RUN wget "https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_${BUILD_ARCH}.tar.gz" 

RUN tar xzvf frp_${FRP_VERSION}_linux_${BUILD_ARCH}.tar.gz -C /tmp && \
    mv /tmp/frp_${FRP_VERSION}_linux_${BUILD_ARCH}/frpc /usr/bin/frpc && \
    rm /tmp/frp_${FRP_VERSION}_linux_${BUILD_ARCH} -r
