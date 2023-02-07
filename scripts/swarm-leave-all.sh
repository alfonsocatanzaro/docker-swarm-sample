#!/bin/bash

leave() {
  local node=$1
  echo "Leaving ${node}"
  docker --context ${node} swarm leave --force
}

# workers
leave node5
leave node4
leave node3

# managers
leave node2
leave node1
