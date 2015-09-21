#!/bin/bash

set -e
cd "$(dirname $0)/.."

COMMAND=$1

if [ "$COMMAND" == "" ]; then
	echo "What would you like to do? Download from docker hub or build your own?"
	echo "Choose [D]ownload/[B]uild?"

	read COMMAND
fi

if [ "$COMMAND" == "D" ]; then
	docker pull eguldenfoundation/egulden-electrum-docker
fi
if [ "$COMMAND" == "B" ]; then
	. bin/build.sh
fi

echo "Complete! Please run your container using ./bin/start.sh"
