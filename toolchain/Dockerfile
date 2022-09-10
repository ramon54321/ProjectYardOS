FROM --platform=linux/amd64 alpine:latest

WORKDIR /opt

ADD setup_toolchain.sh /opt/setup_toolchain.sh
RUN /opt/setup_toolchain.sh

ENV PATH "/opt/toolchain/bin:$PATH"

