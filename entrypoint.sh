#!/usr/bin/env bash

# This is so other entrypoints can be added and they just need to call ./certbizzle.sh to initiate cerbot
./certbizzle.sh

bash -c "$@"
