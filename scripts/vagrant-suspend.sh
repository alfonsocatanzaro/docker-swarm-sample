#!/bin/bash

echo # suspend managers
vagrant suspend node1 &
vagrant suspend node2 &
wait

echo # suspend workers
vagrant suspend node3 &
vagrant suspend node4 &
vagrant suspend node5 &
wait