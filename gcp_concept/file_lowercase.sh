#!/bin/bash

list=`ls -alt | grep GCP | awk '{print$9}'`
echo $list

for i in $list
do 
      upper=$i
      lower=$(echo $i | tr [:upper:] [:lower:])
      mv $upper $lower
done
