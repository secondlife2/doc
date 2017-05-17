#!/bin/sh
# 只需要把 your_appname 替换成你的文件名，本脚本放在程序同目录下，直接 ./run.sh 即可，会自动停止后台进程服务并启动新的进程服务。

NAME=your_appname
echo $NAME
ID=`ps -ef | grep "$NAME" | grep -v "$0" | grep -v "grep" | awk '{print $2}'`
echo $ID
echo "---------------"
for id in $ID
do
kill -9 $id
echo "killed $id"
done
echo "---------------"

# 如果是go源码部署，请打开下面的注释
# go build

nohup ./$NAME > logs.log 2>&1 &
tail -f logs.log

