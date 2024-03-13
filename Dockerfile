FROM ubuntu:20.04 AS builder

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O openjdk.tar.gz https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17%2B35/OpenJDK17-jdk_aarch64_linux_hotspot_17_35.tar.gz && \
    mkdir -p /opt/java/openjdk && \
    tar --extract --file openjdk.tar.gz --directory /opt/java/openjdk --strip-components 1 && \
    rm openjdk.tar.gz

ENV JAVA_HOME=/opt/java/openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"

EXPOSE 8080

CMD ["java", "-jar", "target/demo-1.0-SNAPSHOT-jar-with-dependencies.jar  "]
