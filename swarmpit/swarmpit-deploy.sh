#!/bin/bash

docker --context node1 stack deploy --compose-file swarmpit-stack.yml swarmpit
