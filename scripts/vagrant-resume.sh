#!/bin/bash

echo # resume workers
vagrant resume node3 --no-provision &
vagrant resume node4 --no-provision &
vagrant resume node5 --no-provision &
wait

echo # resume managers
vagrant resume node1 --no-provision &
vagrant resume node2 --no-provision &
wait