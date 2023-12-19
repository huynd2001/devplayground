FROM ubuntu:jammy

# Install make

RUN set -eux \
	&& apt-get update \
	&& apt-get install -y build-essential


# Setting up Java 8 and Java 17

ARG javaversion8=8.392.08-1
ARG javaversion17=17.0.9.8-1

ENV LANG C.UTF-8

RUN set -eux \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        curl ca-certificates gnupg software-properties-common fontconfig java-common \
    && curl -fL https://apt.corretto.aws/corretto.key | apt-key add - \
    && add-apt-repository 'deb https://apt.corretto.aws stable main' \
    && mkdir -p /usr/share/man/man1 || true \
    && apt-get update \
    && apt-get install -y java-1.8.0-amazon-corretto-jdk=1:$javaversion8 \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
        curl gnupg software-properties-common

# ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto

RUN set -eux \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        curl ca-certificates gnupg software-properties-common fontconfig java-common \
    && curl -fL https://apt.corretto.aws/corretto.key | apt-key add - \
    && add-apt-repository 'deb https://apt.corretto.aws stable main' \
    && mkdir -p /usr/share/man/man1 || true \
    && apt-get update \
    && apt-get install -y java-17-amazon-corretto-jdk=1:$javaversion17 \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
        curl gnupg software-properties-common

# ENV JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto

# Setting up C++

RUN set -eux \
	&& apt-get update \
	&& apt-get install -y g++

# Setting up Python

RUN set -eux \
	&& apt-get update \
	&& apt-get install -y python3 python3-pip

WORKDIR /workspace
COPY . /workspace 