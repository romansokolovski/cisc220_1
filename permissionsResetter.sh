#!/bin/bash
mode=$1
fileName=$2
echo "Mode requested $mode, fileName $fileName"
readarray -t lines < $fileName
for line in "${lines[@]}"; do
   echo "line= $line"
   savedPermission=${line%% *}
   file=${line#* }

   echo "$file has saved permission $savedPermission"
   currentPermission="$(stat -c "%A" $file)"
   echo "$file has current permission $currentPermission"
   if [ "$currentPermission" != "$savedPermission" ]; then
     if [ "$mode" == "-s" ]; then
       printf "%16s %16s %16s\n" "Old Current File"
       printf "%16s %16s %16s\n" "$savedPermission $currentPermission $file"
     elif [ "$mode"=="-r" ]; then
       echo "Reset"
      read number1 number2 number3 <<< $(awk 'BEGIN {chars="$savedPermission";gsub("-","0",chars);gsub("r","4",chars);gsub("w","2",chars);gsub("x","1",chars);for(i=1;i<10;i++) {  sum+=substr(chars,i,1);  if (i%3 == 0) {   printf "%d", $sum;   sum=0;  };} print "";}')
      echo "number = $number1$number2$number3"
       chmod $number1$number2$number3 $file
     fi
   fi
done



