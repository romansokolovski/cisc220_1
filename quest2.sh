#!/bin/bash
ip=$(/sbin/ifconfig lo | grep 'inet addr:' | cut -d: -f2 | awk '{print $1}')
finalip={$ip:0:3}

if [[$ip:0:3 == "127"]] ; then
	finalip =$ip"Local IP";

elif [[$ip == 10* || $ip == 192.168*]]; then
	finalip =$ip"Private IP";

else
	finalip =$ip"Public IP";
fi

echo $finalip
echo $ip
