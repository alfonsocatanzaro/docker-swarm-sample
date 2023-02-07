#!/bin/bash

echo # starts workers
vagrant up node3 --no-provision &
vagrant up node4 --no-provision &
vagrant up node5 --no-provision &
wait

echo # starts managers
vagrant up node1 --no-provision &
vagrant up node2 --no-provision &
wait