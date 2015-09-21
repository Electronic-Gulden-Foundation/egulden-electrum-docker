#!/bin/bash

cd "$(dirname $0)/.."

docker build --rm -t eguldenfoundation/egulden-electrum-docker .
