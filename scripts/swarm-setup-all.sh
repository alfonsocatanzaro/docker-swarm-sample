#!/bin/bash


# managers
./$(dirname $0)/swarm-init.sh node1 192.168.99.201  
./$(dirname $0)/swarm-join.sh node2 manager
./$(dirname $0)/swarm-join.sh node3 manager
./$(dirname $0)/swarm-join.sh node4 manager

# workers
./$(dirname $0)/swarm-join.sh node5 worker
./$(dirname $0)/swarm-join.sh node6 worker
./$(dirname $0)/swarm-join.sh node7 worker
./$(dirname $0)/swarm-join.sh node8 worker

docker --context node1 node ls