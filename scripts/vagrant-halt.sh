#!/bin/bash

echo # halt managers
vagrant halt node1 &
vagrant halt node2 &
vagrant halt node3 &
vagrant halt node4 &
wait

echo # halt workers
vagrant halt node5 &
vagrant halt node6 &
vagrant halt node7 &
vagrant halt node8 &
wait