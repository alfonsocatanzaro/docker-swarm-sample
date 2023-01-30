#!/usr/bin/env bash

echo "## removing native ssh config to VMs"
rm ~/.ssh/docker-swarm-hosts
grep -v "include docker-swarm-hosts" ~/.ssh/config > ~/.ssh/tmpfile 
mv ~/.ssh/tmpfile ~/.ssh/config
echo


echo "## finding all VM names"
_vms=( $(vagrant status --machine-readable | cut -d',' -f2 | sort | uniq) )
echo

echo "## removing all docker contexts for VMs"
docker context rm -f "${_vms[@]}"
