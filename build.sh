#!/bin/sh
cd /root/ruoyi
git pull
./mvnw clean package -Dmaven.test.skip=true
