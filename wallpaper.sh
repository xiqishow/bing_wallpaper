#!/usr/bin/env bash

#创建壁纸目录
mkdir -p ~/bing-wallpapers/
cd ~/bing-wallpapers/
#请求一个随机数(bing只能返回0到7)
index_seed="$(jot -r 1 0 7)"
#请求bing服务获得最新一张壁纸(下载UHD壁纸)
rurl_esult="$(curl --location --request GET 'http://www.bing.com/HPImageArchive.aspx?idx='$index_seed'&n=5&format=js' --header 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36'  | grep -o '"url":"[^"]*"'  | sed -e 's/"url":"/https:\/\/cn.bing.com/' | sed -e 's/"//' | sed -e 's/1920x1080/UHD/g')"
#下载壁纸
rm -f wallpapler*.jpg
#随机文件名，否则无法更换壁纸
file_seed="$(date +%s)"
curl $rurl_esult -o wallpapler_$file_seed.jpg
#设置壁纸路径
localpath="/Users/$USER/bing-wallpapers/wallpapler_$file_seed.jpg"
#设置壁纸
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$localpath\""
#提示壁纸设置成功
osascript -e "display notification \"壁纸更换成功\" with title \"定时换壁纸\""