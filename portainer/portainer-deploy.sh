#!/bin/bash

docker --context node1 stack deploy --compose-file portainer-stack.yml portainer
