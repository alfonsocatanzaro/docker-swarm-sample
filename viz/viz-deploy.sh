#!/bin/bash

docker \
--context node1 \
service create \
--name=viz \
--publish=8080:8080/tcp \
--constraint=node.role==manager \
--mount=type=bind,src=//var/run/docker.sock,dst=/var/run/docker.sock \
weshigbee/swarmgs2-viz