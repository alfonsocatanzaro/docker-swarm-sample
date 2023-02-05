#!/bin/bash

echo # starts workers
vagrant up node5 --no-provision &
vagrant up node6 --no-provision &
vagrant up node8 --no-provision &
vagrant up node7 --no-provision &
wait

echo # starts managers
vagrant up node1 --no-provision &
vagrant up node2 --no-provision &
vagrant up node3 --no-provision &
vagrant up node4 --no-provision &
wait