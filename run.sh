#!/bin/sh
kill $(ps -aux | grep java |grep -v grep | awk '{print $2}')
echo > nohup.out
nohup java -javaagent:/root/newrelic/newrelic/newrelic.jar -jar ruoyi-admin/target/ruoyi-admin.jar &