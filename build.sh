#!/bin/sh
git pull
./mvnw clean package -Dmaven.test.skip=true
