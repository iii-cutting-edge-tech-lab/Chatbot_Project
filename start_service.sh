#!/bin/bash
cd /home/ec2-user/deploy
echo "Running service container "
bash getip.sh
bash geturl.sh
docker-compose -f docker-compose.yml up -d
echo "Testing service container "
touch /home/ec2-user/.update_log
docker ps > /home/ec2-user/.update_log
containerNum=`cat /home/ec2-user/.update_log|wc -l`
for ((i=0;i<3;i++))
do
  sleep 5
  if [ $containerNum == 6 ];then
    echo "remove image second "
    pversion=`cat VERSION|cut -d ';' -f 2`
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:older
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/mysql:older
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/redis:older
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:older
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:older
    echo "service deploy success !!" >> /home/ec2-user/.update_log
    break
  fi
  if [ $i == 2 ];then
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:latest
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/redis:latest
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/mysql:latest
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:latest
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:latest
    docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:older 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:latest
    docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/mysql:older 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/mysql:latest
    docker tag 204065533127.dkr.ecr.ap-north-east1.amazonaws.com/redis:older 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/redis:latest
y
    docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:older 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:latest
    docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:older 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:latest
    docker-compose -f docker-compose-older.yml up -d
    echo "service deploy fail QQ" >> /home/ec2-user/.update_log
  fi
done
date >> /home/ec2-user/.update_log
