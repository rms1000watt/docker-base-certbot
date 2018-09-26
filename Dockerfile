FROM python:2-alpine3.7
WORKDIR /opt/certbot

COPY CHANGELOG.md README.rst setup.py src/
COPY entrypoint.sh certbizzle.sh ./
COPY acme src/acme
COPY certbot src/certbot

RUN apk add --no-cache --virtual .certbot-deps \
        libffi \
        libssl1.0 \
        openssl \
        ca-certificates \
        binutils \
        bash
RUN apk add --no-cache --virtual .build-deps \
        gcc \
        linux-headers \
        openssl-dev \
        musl-dev \
        libffi-dev \
    && pip install --no-cache-dir \
        --editable /opt/certbot/src/acme \
        --editable /opt/certbot/src \
    && apk del .build-deps

ENTRYPOINT [ "./entrypoint.sh" ]
