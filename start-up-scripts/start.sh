#!/bin/bash

a=0

cd scripts
for i in *
do
  echo "[INFO] Start-Up script $a : $i"
  source $i
  let a+=1
done
