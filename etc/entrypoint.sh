#!/bin/bash

set -e

COMMAND=$1

if [ "$COMMAND" == "" ]; then
	COMMAND="serve"
fi

cd /etc

mv electrum.conf electrum-template.conf
perl -pe 's/\$(\w+)/$ENV{$1}/g' electrum-template.conf > electrum.conf

cd /electrum/electrum-server

set -x
su electrum -c 'python run_electrum_server.py'
