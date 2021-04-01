#!/bin/bash
echo $touchPadId
while true
do
	sleep 3s
	MouseId=$(xinput | grep -i mouse |cut -d "=" -f 2| cut -d "[" -f 1)
	touchPadId=$(xinput| grep -i touchpad | cut -d "=" -f 2| cut -d "[" -f 1)
	if [ ! -z $MouseId ]
	then
		xinput disable $touchPadId
	else 
		xinput enable $touchPadId
	fi
done
	
