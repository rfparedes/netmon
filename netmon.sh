#!/bin/bash

NODES=(10.215.27.6 10.215.27.7 10.215.27.16)
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>/var/log/netmon.log 2>&1

while :

echo "##############################"
echo "pinging from $(hostname)"
echo $(date)
echo "##############################"
do
  for i in ${NODES[@]}; do
     /usr/bin/ping -q -c 1 ${i}
  done

sleep 5

done

