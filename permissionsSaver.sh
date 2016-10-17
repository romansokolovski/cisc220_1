#!/bin/bash
file="savedPermissions"#!/bin/bash
file="savedPermissions"
fileName=$file
i=0

while [ -f "$fileName" ]
do
  i=$(( $i + 1 ))
  fileName=$file$i
done

stat -c "%A %n" * * >$fileName






