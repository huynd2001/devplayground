# Home grown Local Dev playground

## About
This repository is meant to replicate the local development for VERY simple application. This should be ideal for
Competitive Programming development, or testing new language feature by "Hello World" application.

I plan to support:
- Java (8 & 17)
- C++20 (with `bits/stdc++.h`).
- Python (2.7 & 3.10)
- Go (1.21)
- mySQL
- Haskell
- Scala
- Rust

## Requirement
- [docker](https://docs.docker.com/engine/install/)

## How to build this image

```shell
docker build -t dev-playground:latest .
```

## How to run this image for local dev

_**TODO**_ Figure out how to set up local vscode dev env for better highlight.

```shell
docker run -it dev-playground:latest /bin/sh --login
```