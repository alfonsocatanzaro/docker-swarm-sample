#!/bin/bash

leave() {
  local node=$1
  echo "Leaving ${node}"
  docker --context ${node} swarm leave --force
}

# workers
leave node2
leave node3
leave node5
leave node6
leave node8

# managers
leave node4
leave node7
leave node1
