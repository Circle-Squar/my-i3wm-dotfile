#!/bin/bash
wNum=$(xinput|grep -i wacom|grep -i stylus|cut -d = -f 2|cut -d '[' -f 1)
xsetwacom set $wNum rotate half
xsetwacom set $wNum area 0 0 21600 12150 
