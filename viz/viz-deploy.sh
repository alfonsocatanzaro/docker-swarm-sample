#!/bin/bash

docker --context node1 stack deploy --compose-file viz-stack.yml viz
