#!/bin/bash

echo # halt managers
vagrant halt node1 &
vagrant halt node2 &
wait

echo # halt workers
vagrant halt node3 &
vagrant halt node4 &
vagrant halt node5 &
wait