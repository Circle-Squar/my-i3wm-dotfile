#!/bin/bash
MouseId=$(xinput | grep -i mouse |cut -d "=" -f 2| cut -d "[" -f 1)
xset m 00
xinput --set-prop $MouseId "libinput Accel Speed" 0
