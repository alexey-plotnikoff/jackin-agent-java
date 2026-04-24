FROM projectjackin/construct:trixie

#SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN tar --help

WORKDIR /opt
RUN if [ $TARGETARCH = "arm64" ]; then \
        curl -o graalvm-community.tar.gz -L https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-25.0.2/graalvm-community-jdk-25.0.2_linux-aarch64_bin.tar.gz \
    ; fi
RUN if [ $TARGETARCH = "amd64" ]; then \
        curl -o graalvm-community.tar.gz -L https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-25.0.2/graalvm-community-jdk-25.0.2_linux-x64_bin.tar.gz \
    ; fi
RUN tar -xzf graalvm-community.tar.gz
RUN rm -rf graalvm-community.tar.gz
RUN mv graalvm-community* jdk
ENV JAVA_HOME=/opt/jdk
ENV PATH=/opt/jdk/bin:$PATH

USER claude
