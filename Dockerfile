FROM --platform=linux/amd64 ubuntu:jammy

RUN set -eux \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \ 
		build-essential curl ca-certificates gnupg software-properties-common fontconfig java-common wget

# Setting up scripts running

COPY scripts/* /bin/

RUN find /bin/run-*.sh -type f -exec chmod +x {} \;

# Setting up Java 8 and Java 17

ARG javaversion8=8.392.08-1
ARG javaversion17=17.0.9.8-1

ENV LANG C.UTF-8

RUN set -eux \
    && apt-get update \
    && curl -fL https://apt.corretto.aws/corretto.key | apt-key add - \
    && add-apt-repository 'deb https://apt.corretto.aws stable main' \
    && mkdir -p /usr/share/man/man1 || true \
    && apt-get update \
    && apt-get install -y java-1.8.0-amazon-corretto-jdk=1:$javaversion8

# ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto

RUN set -eux \
    && apt-get update \
    && curl -fL https://apt.corretto.aws/corretto.key | apt-key add - \
    && add-apt-repository 'deb https://apt.corretto.aws stable main' \
    && mkdir -p /usr/share/man/man1 || true \
    && apt-get update \
    && apt-get install -y java-17-amazon-corretto-jdk=1:$javaversion17

# ENV JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto

# Setting up C++

RUN set -eux \
	&& apt-get update \
	&& apt-get install -y g++

# Setting up Python

RUN set -eux \
	&& apt-get update \
	&& apt-get install -y python3 python3-pip

# Setting up Go
# TODO

ARG goversion=1.19.5

RUN set -eux \
    && rm -rf /usr/local/go \
    && wget https://go.dev/dl/go${goversion}.linux-amd64.tar.gz -P /tmp/ \
    && tar -C /usr/local -xzf /tmp/go${goversion}.linux-amd64.tar.gz

WORKDIR /workspace
ENV WORKSPACE /workspace
COPY . /workspace 
