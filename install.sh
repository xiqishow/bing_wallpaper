#!/usr/bin/env bash

#设置定时任务，每30分钟
rm -f cornjob
cFolder="$(pwd)"
echo "*/5 * * * * $cFolder/wallpaper.sh >> /tmp/bw.out" >> cornjob

#echo "* * * * *  echo '123' >> /tmp/bw.out" >> cornjob
crontab cornjob
#./wallpaper.sh 