#!/bin/bash

CONTEXT=$1
ROLE=$2
BASEDIR=$(dirname $0)/../.vagrant

show_usage()
{
  echo "usage: ./swarm-join [context] [manager|worker]"
}

swarm_join()
{
  echo "#  ${CONTEXT} - reading tokens"
  TOKEN=$(<${BASEDIR}/.${ROLE}-token)
  ADDRESS=$(<${BASEDIR}/.advertise-addr)

  echo "#  ${CONTEXT} - joining swarm"
  docker --context ${CONTEXT} swarm join --token ${TOKEN} ${ADDRESS}:2377 
}

if [ ! "$#" -eq 2 ];
  then show_usage; exit 1; fi
if [ "${ROLE}" != "worker" ] && [ "${ROLE}" != "manager" ]
  then show_usage; exit 1; fi

swarm_join