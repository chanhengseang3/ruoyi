#!/bin/sh
kill $(ps -aux | grep java |grep -v grep | awk '{print $2}')
echo > nohup.out
export CUSTOM_PATH=/home
nohup java -jar ruoyi-admin/target/ruoyi-admin.jar &