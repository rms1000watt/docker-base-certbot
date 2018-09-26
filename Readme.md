# Docker Base Certbot

## Introduction

Docker base image for automatic cert generation via Certbot (Letsencrypt)

## Contents

- [Build](#build)

## Build

```bash
./build.sh
```

## Run

```bash
docker run -it --rm rms1000watt/docker-base-certbot

docker run -it --rm -v $(pwd)/entrypoint.sh:/opt/certbot/entrypoint.sh rms1000watt/docker-base-certbot
```
