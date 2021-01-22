#!/bin/bash

# Make Sure Have a Networking
sleep 1m

# 获取URL
curl "https://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=zh-CN" > bingurl.txt
sed -i "s/,/\n/g" bingurl.txt
URL_PART=$(cat bingurl.txt |grep '"url"'|cut -d '"' -f 4)

echo $URL_PART


bingWallPaperMainUrl="https://cn.bing.com"

FULL_PATH=$bingWallPaperMainUrl$URL_PART

echo $FULL_PATH

fileName=$(date "+%Y-%m-%d-")$(echo $URL_PART |cut -d = -f 2 |cut -d '&' -f 1)
echo $fileName

wget -O ~/Pictures/WallPapers/$fileName.jpg $FULL_PATH

rm bingurl.txt
