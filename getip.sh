#!/bin/bash
#獲取public-ipv4 並以IPA_ENV=ip 的格式存入文件ip.env
echo "IPA_ENV=`curl http://169.254.169.254/latest/meta-data/public-ipv4`" > ./ip.env
