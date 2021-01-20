#!/bin/bash

a=0
for i in ~/.config/start-up-scripts/*
do
  echo "[INFO] Start-Up script $a : $i"
  sh $i &
  let a+=1
done
