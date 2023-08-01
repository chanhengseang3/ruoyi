#!/bin/sh

echo > nohup.out
nohup java -javaagent:/root/newrelic/newrelic/newrelic.jar -jar ruoyi-admin/target/ruoyi-admin.jar &
