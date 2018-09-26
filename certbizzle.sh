#!/usr/bin/env bash

IGNORE_CERTBOT_ERRORS=${IGNORE_CERTBOT_ERRORS:-false}

if [[ -z $DOMAIN ]]; then
  echo "ERROR: no \$DOMAIN specified"
  exit 1
fi

if [[ -z $EMAIL ]]; then
  echo "ERROR: no \$EMAIL specified"
  exit 1
fi

certbot certonly -d "$DOMAIN" -m "$EMAIL" --agree-tos --standalone --no-eff-email
err=$?

if [[ $IGNORE_CERTBOT_ERRORS != "true" ]] && [[ $err != 0 ]]; then
  echo "HINT: Set \$IGNORE_CERTBOT_ERRORS=true to ignore errors"
  echo "ERROR: Failed running certbot.."
  exit 1
fi
