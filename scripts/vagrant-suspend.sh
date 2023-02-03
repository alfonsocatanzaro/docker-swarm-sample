#!/bin/bash

echo # suspend managers
vagrant suspend node1 &
vagrant suspend node2 &
vagrant suspend node3 &
vagrant suspend node4 &
wait

echo # suspend workers
vagrant suspend node5 &
vagrant suspend node6 &
vagrant suspend node7 &
vagrant suspend node8 &
wait