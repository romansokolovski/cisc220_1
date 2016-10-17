#!/bin/bash
ip=$(/sbin/ifconfig lo | grep 'inet addr:' | cut -d: -f2 | awk '{print $1}')
finalip=""
if[$ip == 127*]; then
	finalip =$ip"Local IP"

elif [$ip == 10* || $ip == 192.168*]; then
	finalip =$ip"Private IP"

else
	finalip =$ip"Public IP"
fi
echo finalip
