#!/usr/bin/env bash

set -e

git clone https://github.com/certbot/certbot.git git
rm -rf setup.py acme certbot CHANGELOG.md README.rst

cd git
mv setup.py     ../setup.py
mv CHANGELOG.md ../CHANGELOG.md
mv README.rst   ../README.rst
mv acme         ../acme
mv certbot      ../certbot

cd ..
rm -rf git
