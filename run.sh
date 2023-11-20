#!/bin/sh
kill $(ps -aux | grep java |grep -v grep | awk '{print $2}')
echo > nohup.out
nohup java -jar ruoyi-admin/target/ruoyi-admin.jar &