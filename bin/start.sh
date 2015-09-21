#!/bin/bash

set -e
cd "$(dirname $0)/.."

source .env

IMAGE_NAME="eguldenfoundation/egulden-electrum-docker"
CONTAINER_NAME="egulden-electrum"
EGULDEND_NODE_CONTAINER_NAME="eguldend"

START="\
	docker run -it
		--link $EGULDEND_NODE_CONTAINER_NAME \
		-e EGULDEND_HOST_IP=$EGULDEND_HOST_IP \
		-e EGULDEND_HOST_RPC_PORT=$EGULDEND_HOST_RPC_PORT \
		-e EGULDEND_RPC_USER=$EGULDEND_RPC_USER \
		-e EGULDEND_RPC_PASSWORD=$EGULDEND_RPC_PASSWORD \
		-p 50001:50001
		-d --name=$CONTAINER_NAME \
		"

set -x
exec $START $IMAGE_NAME $@
