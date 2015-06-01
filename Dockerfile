FROM ubuntu:14.04

WORKDIR /tmp/qperf

ENV QPERF_DOWNLOAD_LINK https://www.openfabrics.org/downloads/qperf/qperf-0.4.9.tar.gz
ENV QPERF_TAR qperf-0.4.9.tar.gz

# Install wget
RUN ["/bin/bash", "-c", "apt-get update && apt-get install \
wget \
build-essential \
-y"]

# Download and extract qperf
RUN ["/bin/bash", "-c", "wget $QPERF_DOWNLOAD_LINK && \
tar -xvf $QPERF_TAR && \
rm $QPERF_TAR"]

# Build qperf
WORKDIR qperf-0.4.9
RUN ["/bin/bash", "-c", "./configure && \
make"]

# Copy qperf 
RUN ["/bin/bash", "-c", "cp src/qperf /usr/local/bin"]

WORKDIR /

CMD ["/bin/bash"]


