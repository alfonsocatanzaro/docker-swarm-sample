#!/bin/bash

CONTEXT=$1
IPADDR=$2
BASEDIR=$(dirname $0)/../.vagrant

show_usage()
{
  echo "usage: ./swarm-init [context] [advertise-addr]"
}

swarm_init()
{
 
  echo "# ${CONTEXT} - initialize swarm"
  docker --context ${CONTEXT} swarm init --advertise-addr ${IPADDR}

  echo "# ${CONTEXT} - saving tokens"
  echo ${IPADDR} > ${BASEDIR}/.advertise-addr
  docker --context ${CONTEXT} swarm join-token -q worker  > ${BASEDIR}/.worker-token
  docker --context ${CONTEXT} swarm join-token -q manager > ${BASEDIR}/.manager-token
}

if [ ! "$#" -eq 2 ]; then show_usage; exit 1; fi

swarm_init
