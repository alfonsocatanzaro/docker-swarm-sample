#!/bin/bash

docker \
--context node1 \
service create \
--name=homepage \
--publish=80:80/tcp \
acatanzaro/homepage:latest